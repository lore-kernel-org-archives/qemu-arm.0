Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3241389ejc;
        Tue, 10 Jan 2023 07:06:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvOa/ycw7F3jFs+Mgcw0U4cjRGBTgyFcO901X00fs1/dr/kE4WwBaNnR5oh5eYkOMhVlGP1
X-Received: by 2002:a05:6214:4383:b0:4c7:7e73:464d with SMTP id oh3-20020a056214438300b004c77e73464dmr40012045qvb.20.1673363216248;
        Tue, 10 Jan 2023 07:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673363216; cv=none;
        d=google.com; s=arc-20160816;
        b=vC4zkNpkK0f7Iti8n03QfcoQvXw8K2RRc0X71vn1pk8P+9a4LcuUFfbX0xEGlZ/Dzh
         hwPlvfZ2Mehj7ixxIsZWTY/uDMaIF1FRIhp4Q2FcnWlU5G4/VqFS5ubogs7zGpsl4TY/
         0FMpbNilstkaCCSeu33HXDMohOKBYbIqVcRHJQqBaENGQClwQdeY5V3vExCPh1bTq5pR
         DDQJMxMekZcwuAXwkFtawK4grkC2JEnYqClbmqK35yyuU7jWhnnzOXKfUCE5xtV1w4RT
         DIhAYRyNhMdf3h7z6k8UaPCon0cNPea/CE8nhhpa40Cs7XwlSSfZQfAcUh+SLJNH9VJi
         kv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=S53fopYlto7GATnEBLPdwchlTbAjmE+Zrf3fu00VL9U=;
        b=rO9/u0hC4LsiAn2UbqXFnpyAab0+aBHGiOFhtlI6nAzI+I3KBJ+U7lzlSEfjAvAqaI
         NgiUKTA+9ieG0V2rzCXhPcbIToPwxOp7w0ILc/MD73uW6NPKONUZIn1uXVSfimusP2uv
         kHUdbzGQK6HoZyljM0Ucm6c4U73WrvcjxtEGuA8APmby6nOrhRCtCrE4k0Ij2m7/g+Ld
         oCEjQ3rvwFl1S7ApuA7ShfYovcH4q4KuT/3ZvP3BHZfMx3kPorzoBFC7c3H/syWes2jW
         PBWdHAMNTJ3o98yt841wK/d6PyXddEiIMy3FiFYgsp9H8+jWY57zAdveqRAczlRZu0ov
         ZGfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JSNneCK1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id q3-20020a056214194300b00531d3100d40si6842095qvk.527.2023.01.10.07.06.56
        for <alex.bennee@linaro.org>;
        Tue, 10 Jan 2023 07:06:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JSNneCK1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFFIj-0008Ci-Co; Tue, 10 Jan 2023 09:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFFIf-0008Am-Og
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 09:08:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFFIe-0004gW-9v
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 09:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673359703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S53fopYlto7GATnEBLPdwchlTbAjmE+Zrf3fu00VL9U=;
 b=JSNneCK13qC1TfrGvw+kxiCd4o0gBWce98ST8NYcztFd1J38fQg8bdtFaByDbs4SMK2FLy
 Nv14v7aI9oR2YIfBVhmGWhhkShod1TZ5y1yL9XXsZ1FPXtG5JQVN9lNi5SgITkLDzRyJCQ
 EGK61egIHFZxL4Yf4YmjAmN2VPiHXls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-lbQzg5JzOeqnyA1bzBhYXg-1; Tue, 10 Jan 2023 09:08:20 -0500
X-MC-Unique: lbQzg5JzOeqnyA1bzBhYXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09AFF80557C;
 Tue, 10 Jan 2023 14:08:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C93A422FE;
 Tue, 10 Jan 2023 14:08:06 +0000 (UTC)
Date: Tue, 10 Jan 2023 15:08:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Xiang Zheng <zhengxiang9@huawei.com>
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
Message-ID: <Y71xRO+sHh+TZ3PS@redhat.com>
References: <20221220084246.1984871-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220084246.1984871-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PA6PnRV7u3oE

Am 20.12.2022 um 09:42 hat Gerd Hoffmann geschrieben:
> From: Xiang Zheng <zhengxiang9@huawei.com>
> 
> Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
> when using persistent UEFI variables on virt board. Actually we only use
> a very small(non-zero) part of the memory while the rest significant
> large(zero) part of memory is wasted.
> 
> So this patch checks the block status and only writes the non-zero part
> into memory. This requires pflash devices to use sparse files for
> backends.
> 
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
> [ kraxel: rebased to latest master ]
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks, applied to the block branch.

Even though discussion is ongoing about using alternative devices, it
seems to me that this is a simple optimisation that doesn't change the
behaviour as seen by the guest and that we want to have either way. If
anyone objects and wants me to drop the patch again, let me know.

Kevin

