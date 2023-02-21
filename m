Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3575020ejb;
        Tue, 21 Feb 2023 12:12:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+7EvqUpVm7pfuv/yynV8b9Qvi57OkflzBHPKWODx5rFqk9/WOSCj9uzxq1Lpb+MWv7al5Y
X-Received: by 2002:ad4:5765:0:b0:56c:61:7499 with SMTP id r5-20020ad45765000000b0056c00617499mr9803718qvx.23.1677010367162;
        Tue, 21 Feb 2023 12:12:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677010367; cv=none;
        d=google.com; s=arc-20160816;
        b=sHSviqkqaYJU1d63V8GA0ExmsRV9yzzF+tsbK1fw8mbjT5TjYapBMokwzGnZ2wy5Jb
         lx4bTom/B269GqhxMv5afGhPgnnZPyqZQmEvCttEsdt8FRIdsj9hady+vQMDId9cg4a8
         Xaak1jz/N3w0BPvLC7NKaG2ffQTNdoms4wNKIp5JxlzeOZ32ir7VVokHmGWB7VtZuuBo
         hiY8Mn2qHw47W6aZzT1SPYRT/FW5VJrn09SevLYvdZXrn/OfWuEnn0tb4A2wwTASQWhj
         Kh43dqvEjJnGehbSVci5zFiQbLBOeLQMOBrbRS9ZR0fa3rNSuy8YKBS55OeYCcgy2QHp
         hbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=6NQZbo5yyFMPpbBOZnyjvkcGxSEPl9WjIKfNtfpxwLI=;
        b=ZnaROqzINFIqWi7XFwhL81FuxZ/415Tuq6atcCZnN1t/V2hhd4bD2G+gy5LXOivnzx
         iFnPWU1jS1Zfpegdi9+4CdKeauGbbC4fZHKC+TwDBho1kbgrsXhj53R7g6Sa1cC1OIZ/
         0ZiYDlq6nYC7YaajzKcq6EGO7Gr3RvNA/W3laNF8qscVId4TTtt2TTHCsAB5NF6uuJCn
         Avwmv+2Zc5NNdB9abm16MJp9+Rv7odx3AyQXm6gfvlmEf/xkkXN+tzUmm8UXrdVaJ4mx
         NoGbzQx8FUUDTKCEWunuK3XF95Fk0P8EZfIv9otiH+VR5u1gWMdugb2U/l4rREV1D2N9
         L/aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="P8fQ/5Tz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26-20020a0c9e9a000000b0056f0669018bsi6236868qvd.35.2023.02.21.12.12.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 12:12:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="P8fQ/5Tz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUZ0A-0004Wv-Sl; Tue, 21 Feb 2023 15:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUZ09-0004Wd-2l
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 15:12:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUZ07-0004pH-Oh
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 15:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677010355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6NQZbo5yyFMPpbBOZnyjvkcGxSEPl9WjIKfNtfpxwLI=;
 b=P8fQ/5TzIlVColRV+UpGgb4IB99gYBLAAliJHChqnvgMDAxKjMjTcNty7rx9tkyjESKWqF
 u/tByUeKMc58fGu9E9fkd8+F0g4zL5+tJKerT4OZ/n6h7rN0XF2TL0pieboeUfNr8rwas6
 tYzk4eZnqsaBop0LUbPNpy+gbE/FNPI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-z81C7DLiNKyrP2WfFCY2vg-1; Tue, 21 Feb 2023 15:12:33 -0500
X-MC-Unique: z81C7DLiNKyrP2WfFCY2vg-1
Received: by mail-qv1-f71.google.com with SMTP id
 y3-20020a0cec03000000b0056ee5b123bbso2591144qvo.7
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 12:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NQZbo5yyFMPpbBOZnyjvkcGxSEPl9WjIKfNtfpxwLI=;
 b=aUShyxaHSjf9d4Sb2Fz2v2SDhVnfv9pWUajAtQmAKESld7/oZdKOMTJutZwKcoP19/
 SgvZzjPvEPIegmI0CBmaI0vXTZu5oDts6rZVDh7ktigYCDaeo6gNZxq2hT0jhPs6QCVV
 Hz4D3ExKq33oxAUXMpE3thAjOn11XJyNLs2CgKXMcM0F8Cq3KuTShJ0b5Gas83/mqTWs
 Oz8t9So9HNcuU7hbWCYd8BIjTvaQx764+0rMhsOOzsUZvaRG/xUudu6eKLZ3C8adXz0d
 nF147D2IZ5LJX8+Vy7VfAnyRgBVqVVgQZ3O3V3nJEe/yHIi81fOQ/cGxJJ4y1GII3KUL
 Tsvg==
X-Gm-Message-State: AO0yUKWneiiaiEFkuCh1+QGnjyxScM9K69FsTv8lsW9EYmVA9dQBrhON
 e7t7bCfExAWdT2JIU8u1KLIYTwUl68cySBODKB4VVMKYzSc//kUGd+eGd9ChCswsnHrWftZmuHe
 wrDWFCjcecaxF
X-Received: by 2002:ac8:570e:0:b0:3a9:86dd:3c5d with SMTP id
 14-20020ac8570e000000b003a986dd3c5dmr11479747qtw.5.1677010353251; 
 Tue, 21 Feb 2023 12:12:33 -0800 (PST)
X-Received: by 2002:ac8:570e:0:b0:3a9:86dd:3c5d with SMTP id
 14-20020ac8570e000000b003a986dd3c5dmr11479717qtw.5.1677010352995; 
 Tue, 21 Feb 2023 12:12:32 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 c70-20020a379a49000000b0073bacce6ad7sm9164368qke.82.2023.02.21.12.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 12:12:32 -0800 (PST)
Date: Tue, 21 Feb 2023 15:12:30 -0500
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v1 4/6] kvm: Add helper kvm_dirty_ring_init()
Message-ID: <Y/UlriVMY7kTWPhj@x1n>
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-5-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230213003925.40158-5-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
X-TUID: KhHTvx/LnieQ

On Mon, Feb 13, 2023 at 08:39:23AM +0800, Gavin Shan wrote:
> Due to multiple capabilities associated with the dirty ring for different
> architectures: KVM_CAP_DIRTY_{LOG_RING, LOG_RING_ACQ_REL} for x86 and
> arm64 separately. There will be more to be done in order to support the
> dirty ring for arm64.
> 
> Lets add helper kvm_dirty_ring_init() to enable the dirty ring. With this,
> the code looks a bit clean.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

