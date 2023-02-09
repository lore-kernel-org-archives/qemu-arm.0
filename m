Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1104421ejb;
        Thu, 9 Feb 2023 11:48:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/klmTLiV5mHt4NfwUc67gOeL7BPv4aXZRefGdl87zLwSp1K86l2GUkB0CMgKlEAfrOWRWc
X-Received: by 2002:a05:6214:27ed:b0:552:9c08:7c9a with SMTP id jt13-20020a05621427ed00b005529c087c9amr20007715qvb.15.1675972132905;
        Thu, 09 Feb 2023 11:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675972132; cv=none;
        d=google.com; s=arc-20160816;
        b=xmbIEOcwfb8nqanGpEwF9mt/1no6UYXXRyvWRYkDgZOc3Pynr/Jt/+NTX57dpyf0Nx
         zqRHj5duiUjbkGtG89Ms6WSHYvsyCX6kLDVZ7AhZgJsalLULBavKvyCJYYNcFQcbNjrv
         uHVIhv3Wtuf8TyzoyrL9O4WnArAqJbHO9EIPcnpx1LORK7Fz6FaZ1bNAkDpTGhDIPVCs
         1+YD7xVnnkabtNkKNk85TpgamaIif6hhIYWq7P8vK7vOun3sz8tczhd0qchdSptjmRLT
         dOCMt/J5xE1Jyk66D7fkacnt04z5ifEVQURXsPOBaVH/wye/6kjpdkOOcWXpe5wAyBYI
         aY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=49k5dHSfFHAuH+GfZp3woB7SltOb5x6HuuT9s9fP7AQ=;
        b=SO2XtWSTswNG+3DG1iXXTRpJLxXesRjSerPZFgVV1tkJ8aOQtu0DuLEYUTLcPNq7uf
         LfwNMIv9tEMjaBU8kfNbnV8DFr65IEIUJt7AXFmH/L7z4lIqkKMjlqciGD8+GKt5Wjkl
         ZszgNzuZi/1UJ6d8oucUKGTpPFQaLx7puTseLZXAzEdtDNFByq5kE2QT0NRuExqN7ON1
         WAkQfaPvqA3EYhOWoldnz3aAzkzbEPlrY2loFmbhgo6c0KOl1zIgL+b0w489GFGKiIqz
         b2sNWBsO6FgkgBjdbI1tndCDvmbDZaQrIKKo3CMbJw7mN8bNwNwP10JYRxkDMPcAJymf
         5Elg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KJNwx0q/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v64-20020a37dc43000000b00720263e936dsi2147528qki.60.2023.02.09.11.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Feb 2023 11:48:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KJNwx0q/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQCuD-0005wh-OD; Thu, 09 Feb 2023 14:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQCu6-0005vN-0f
 for qemu-arm@nongnu.org; Thu, 09 Feb 2023 14:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQCu4-0004ku-3k
 for qemu-arm@nongnu.org; Thu, 09 Feb 2023 14:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675972098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=49k5dHSfFHAuH+GfZp3woB7SltOb5x6HuuT9s9fP7AQ=;
 b=KJNwx0q/LPLDuy5KzfBWGVJPEbZ7tAC5/A8zOcxNtZV8CedOF30cWZE+FS97I8K5WkBaAw
 EO2SziBT2TYlY/DCC2UkMvTWsq0x1aqq2sJGDvWHb2mOZbfFOzvkIcMnMm/4a3M9x7aPYN
 Ln3oA1u9aShhY1G+5+t+/DMp+zJgN7c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-mAoYx3QMNbeu-xJTozOgSg-1; Thu, 09 Feb 2023 14:48:17 -0500
X-MC-Unique: mAoYx3QMNbeu-xJTozOgSg-1
Received: by mail-qk1-f199.google.com with SMTP id
 s7-20020a05620a0bc700b006e08208eb31so1936301qki.3
 for <qemu-arm@nongnu.org>; Thu, 09 Feb 2023 11:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=49k5dHSfFHAuH+GfZp3woB7SltOb5x6HuuT9s9fP7AQ=;
 b=IHNWX5asrPfIgOc6lUPtf/g1++XZy9xoU1AvUoHd85B4apJO/lYBIBoRcdVp3/kVI6
 B6fh7K4+ikpwFqeQo3QKGgx84PAWeB6ruYyKXfcZ73R7RUlJjFPabCMzShmdTtjlU51j
 N9T17Qw2cUeN9j3NpgOoovM8IG9e4+iNM4Fq86R2YEWxJvUBUAd+X4J5MpZdOBpNjjlK
 kNMVOkRv+fxTluTn88e3/ps4ZueA5npL3Nhzc1yvT9fI+qCDjXgcg6WcLqMx31M0qMfi
 XrqmMQ0LuF37l17KhbfqSaoOypClm/uNk8PPYv9AzB00IXpqATaL9CPF9O3qxQH4ibOA
 KGUQ==
X-Gm-Message-State: AO0yUKVSpd5j7/nPJfq/krBWm/rhCH8sp1j0BdYa7vPYxP8sPdJfv2P3
 2RmqpMi8XkyzkNQ5bPCDtQf8e7GwtVV2diOXBbMxDDXyVUnEWYyD03/enGOgYgtyCy2BLXewo0n
 PpNkNtsN5BWdF
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr22355152qtp.0.1675972096499; 
 Thu, 09 Feb 2023 11:48:16 -0800 (PST)
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr22355117qtp.0.1675972096257; 
 Thu, 09 Feb 2023 11:48:16 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 e6-20020ac81306000000b003b8484fdfccsm1879077qtj.42.2023.02.09.11.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 11:48:15 -0800 (PST)
Date: Thu, 9 Feb 2023 14:48:14 -0500
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 2/8] memory: Add last stage indicator to global
 dirty log synchronization
Message-ID: <Y+VN/vWvdO2IxL3C@x1n>
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-3-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230206112010.99871-3-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lRp23vjZHdvP

On Mon, Feb 06, 2023 at 07:20:04PM +0800, Gavin Shan wrote:
> The global dirty log synchronization is used when KVM and dirty ring
> are enabled. There is a particularity for ARM64 where the backup
> bitmap is used to track dirty pages in non-running-vcpu situations.
> It means the dirty ring works with the combination of ring buffer
> and backup bitmap. The dirty bits in the backup bitmap needs to
> collected in the last stage of live migration.
> 
> In order to identify the last stage of live migration and pass it
> down, an extra parameter is added to the relevant functions and
> callback. This last stage information isn't used yet.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  accel/kvm/kvm-all.c   |  2 +-
>  include/exec/memory.h |  5 +++--
>  migration/dirtyrate.c |  4 ++--
>  migration/ram.c       |  6 +++---

Better move the migration/ changes into the next patch.

Thanks,

-- 
Peter Xu

