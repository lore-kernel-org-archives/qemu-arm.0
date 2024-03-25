Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564831ejj;
        Mon, 25 Mar 2024 01:55:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4upAHIzNsKE3nuBEZEs0PiXA6h9LZefvH7tYdxU30IJ8GOwVNuq8dUC8xtlhdfzLSX5rz5DhjjfjagRBRycNmYoqs76wR
X-Google-Smtp-Source: AGHT+IENFKHsGBTpW8Se5hd91ubshPKOA2hQnZYgdcHaFu8knb133UryN7alh1cKXen1mPmMprdW
X-Received: by 2002:a05:6214:2aa2:b0:691:83a:13b with SMTP id js2-20020a0562142aa200b00691083a013bmr7397823qvb.64.1711356921153;
        Mon, 25 Mar 2024 01:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356921; cv=none;
        d=google.com; s=arc-20160816;
        b=zwZUWWDbDyJmLRAy9obCdN+oVoo8MVKxjAMR+ODwoGIFA7xIVkbuoXOVSO7jvgcKbh
         245FqXOTPoME0xmH+RgCzelnKNFqtQlT6N1A55qai2dkw40hLEZU8NtYzlI+EJ+jzRKU
         W+RA4Fy60s9+/L+/jyjhKZ+tN7cK6vwL+d8yQ6nK6x2PWOhvRh/t5NoREL7thRJWji+8
         QyeVT7Du1lD43j+/0POqlXsJ0kjqpiVSGdFz7gS7+F2Od1AOPe14HLTqms0Nu3rH66ax
         kfilavetbaExgNHQTlwF3QT6PKerqc1hWFFWMMTMXp/aCSJTFK5N+SG6Lxa3OnVMGfH3
         miOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=NzcgNkYTAZFq8h8Dt8F6evBpJr85CKu5FqXaOBLyeEg=;
        fh=4jw+VptL5gS0ABgMJLbJ5FyRdwU54g1TscK8faLrSxo=;
        b=Q7t9Yv7Z9si7+B3Z0e8ARgwRDOTKxdu4URAwT4G0pSK0LEnmi7equxvSSo/M3fChvh
         IaZSpVwHvvwSEQox5VaVACcYlwOksegXG3dKFWFhm4Ldbp7OsiFepsBoVHlFqUX0ED7N
         6Ji+LHOfWavgqo3R3LzLROc4eMBxoS53B7L0npaBZnigF6lc3Dsz5sgCVddahjNzT1BG
         Ne121Nu3R4NHbFmikruN9aEx4sNpt8StK5CgyF9W6IBaBWpIK6WppZKU8eS5iW3pVSaV
         HAj5Vct0NcgwTFcvlAprSCKZid+KOrgUFyjZ+qxflkCYZDnJSVDNu1TM6U3OAwcZ7LkD
         liew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b735vAGD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq14-20020a056214460e00b0069694bb7ee4si225007qvb.6.2024.03.25.01.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b735vAGD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog6w-0007Ja-D4; Mon, 25 Mar 2024 04:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1rog6u-0006xI-6d
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 04:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1rog6r-0007zm-VE
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 04:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711356912;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NzcgNkYTAZFq8h8Dt8F6evBpJr85CKu5FqXaOBLyeEg=;
 b=b735vAGDp8h9LXc0akTItWEq4SyEHtChrFqSqRqB30hq1AIgIwoNPz4dvhzq533Q1rxtKk
 gy/t8cf+5D1yrYgKdfc4uOB5gvW7VC3uS7d8Su0bKMs3txi9r+9C+ik2GOYViYXumo3tjV
 1TJ/vDTbI/Y7QRRfvOjBd3bf/Gp3TS4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564--PeoPhtRNtmBTkNW7yapaw-1; Mon,
 25 Mar 2024 04:55:09 -0400
X-MC-Unique: -PeoPhtRNtmBTkNW7yapaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81EFB3C0E202;
 Mon, 25 Mar 2024 08:55:09 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B0742022EA7;
 Mon, 25 Mar 2024 08:55:08 +0000 (UTC)
Date: Mon, 25 Mar 2024 08:55:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v8] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Message-ID: <ZgE71v8uGDNihQ5H@redhat.com>
References: <20240312074849.71475-1-shahuang@redhat.com>
 <Zf2bbcpWYMWKZpNy@redhat.com>
 <1881554f-9183-4e01-8cda-0934f7829abf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1881554f-9183-4e01-8cda-0934f7829abf@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mXbq3Q5dS+K5

On Mon, Mar 25, 2024 at 01:35:58PM +0800, Shaoqin Huang wrote:
> Hi Daniel,
> 
> Thanks for your reviewing. I see your comments in the v7.
> 
> I have some doubts about what you said about the QAPI. Do you want me to
> convert the current design into the QAPI parsing like the
> IOThreadVirtQueueMapping? And we need to add new json definition in the
> qapi/ directory?

Yes, you would define a type in the qapi dir similar to how is
done for IOThreadVirtQueueMapping, and then you can use that
in the property setter method.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

