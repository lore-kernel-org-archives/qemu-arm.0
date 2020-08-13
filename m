Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp469192lfy;
        Thu, 13 Aug 2020 05:21:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVD0icIt5nSx1pDi+vwanaQ7FzsvZlZQWzjlQJ6+ZIu/hwtt8ercV7ycoXt3lOR8vzGGUX
X-Received: by 2002:a25:ca50:: with SMTP id a77mr6167185ybg.286.1597321307914;
        Thu, 13 Aug 2020 05:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597321307; cv=none;
        d=google.com; s=arc-20160816;
        b=ztKJb+ghxjY4sObmr97W0TKQ0S1Wsg2M2tCE6QJq5hfuMvwpQJTHEmAYHDc2ii3lXt
         ZpThvV2YEbjx81UvkT0IcIlAqqMfzyghyEgEF7kdDwML/xQaHSgVVqeXRuzK141yUhbY
         oKzBDHzGraB7v7EpdTPi1RbRpUV1Mlvfh8dbO1PDQGhI53j2ghn2aZi6+8lq/unZlt3y
         +WqQlG9iXJq4e1zO7S1a6xqttQukHT9tyzQ39Y4I9Pqa4AJrr4Jt8Biac7TybouFKsB8
         8sfrqEegRiIMQ2SOrxlAEbVSTDS5Glwue0nj48o7IJ+2ZPF7qPruD3Y+Ik4XkP+aFE5t
         a8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=HjhGucHwKvgQ/UHH7Ba9OhUFdAHTbRW3z8GcwsfnJ5k=;
        b=ZpW+XZ2KJxxpI9b9GkLpbd8YZF4hDh5c4Z4F6Yr/LigkFerlSy5cJP1JdQBVAZwiDY
         oZfC6PGHnXVOaGKPHi0RMyg7sfWYHtUWtrLClfOTK3Mc8OGY/jgjAXtu46ZA0bBwSiaE
         QmVIokqa5EyHMgskG3D23/aMSgXtFVdpcdKZ5Q87xuiqMjpayFF/FASFNMuhdRREaRnA
         TvGkT8JK26Y4akMI5t573kH0Ft2nRjq5KjTScF99JxTloP42pvwdWHsyudRk1jYwa7Yj
         WuqK68B/PI6Z4w376i2XECQXsKZA9s93bgEEMwJfgjEmSPrtl2hZ3l+4l1sgHku4Gqxm
         fWJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LMmFqDLr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si5539126ybe.266.2020.08.13.05.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 05:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LMmFqDLr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6CEt-00005h-AJ
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 08:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6CEa-0008Ex-5U
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 08:21:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40181
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6CEY-0002na-N8
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 08:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597321285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HjhGucHwKvgQ/UHH7Ba9OhUFdAHTbRW3z8GcwsfnJ5k=;
 b=LMmFqDLr5pWfdLId/bSISHhNkxmeGPfCc8gJw3Uachh6X3t/TVLJQ6CkQgV+tNDsk6zHRb
 G13aZsOkDjSsbtOnmqchDJsXF1YtQ3DMJdHvgEE1LwtapCnrNOSK6CQLubFIdGhiKTsJ4j
 qNqSI6C1oHOHB3fvuMaf9FYbRevCCwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-l8p3c2BzOce5GJhqFvyNcg-1; Thu, 13 Aug 2020 08:21:23 -0400
X-MC-Unique: l8p3c2BzOce5GJhqFvyNcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5269C807321;
 Thu, 13 Aug 2020 12:21:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02CFA60BFA;
 Thu, 13 Aug 2020 12:21:16 +0000 (UTC)
Date: Thu, 13 Aug 2020 14:21:13 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [RFC 2/9] target/arm: parse cpu feature related options
Message-ID: <20200813122113.3esshhhnolqpe6ok@kamzik.brq.redhat.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-3-liangpeng10@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813102657.2588720-3-liangpeng10@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BlB6Lkoaar5d

On Thu, Aug 13, 2020 at 06:26:50PM +0800, Peng Liang wrote:
> The implementation of CPUClass::parse_features only supports CPU
> features in "feature=value" format.  However, libvirt maybe send us a
> CPU feature string in "+feature/-feature" format. 

Why would libvirt do that? If we have a boolean feature, then I'd think
libvirt should be capable of sending feature=on/off just as easily as a
+/-feature. Indeed libvirt seems to do the right thing with all the
CPU features we already have: pmu, sve*, ...

Thanks,
drew

