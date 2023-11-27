Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp663100ejt;
        Sun, 26 Nov 2023 16:23:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/HtkgRZoSx1+r75t7P/xWP3laXp7xxCHXpLLO5OhzBVTk2jheG3yMZWD13c3LCsgbLSja
X-Received: by 2002:a05:6359:2885:b0:16d:be4c:4e64 with SMTP id qa5-20020a056359288500b0016dbe4c4e64mr8123260rwb.15.1701044602957;
        Sun, 26 Nov 2023 16:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701044602; cv=none;
        d=google.com; s=arc-20160816;
        b=aeFMuBfIPZCNwQ7US67mL3aWCRamcboWWr3L6s5qLucNvyYu2Jv89xjYn+7c0pxLs8
         wfYTUb2ANP2geWnnA7J+GC72sqG1UCnJ3VEVSxmbvg/tQ8KhFMAaMFzH3RulPQabXV54
         VYHO/JMgeg2oxFjskJARizjlzkkunluEYt5GOOhOF1eyLE2PvTybcF2z3ufq2jW/NUTL
         h016DnViEKb6Bh0vITdW/a5QbQBzPTemuj/XJYRhgoCYYV/ymFyuG4r8xbL4lvOHlctK
         fkHN2wZV4hm9ktPVSrt5KjIb0yuUqg2t0GSIM4+v21vhqYF6Oyr/9VEc6XoHu+w5+9ov
         18vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=s/5hhuo3PbLrdJBGlLY57GFAX7PwJW1kv2rTLImRgnE=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=kg6yVBlvZvZ5Y6LdqFUSeimYFIBjldjpKXTOb8Mz3rgXVxY/4KaCISP/PPg4SV9F55
         cc4b9VPNkqXzcDWYPgGSem0Thez7Zn8dVy/FljK0kXFngG4KZ173zee0awgNzYs7TTgz
         QfbrQOmhRciUPk2uGVWCJaNWkyAzJi8qeTBVG6RqOwhRQdMfevdGoc0TGWKF98X+CH4G
         kWfx5QVWQIiMdOCpfcgOT/nmZfl54O9IvjAJACFy1velncAbkg1ip0kS8xGeo40L9BWo
         6MjaUL0p1X75WiSMlZ1CmhyNANDFOZDiVZGbfC0fh1YLJTVKrrWpqofKH80RBj35YPss
         HcCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q39OZemC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh14-20020a05621429ce00b0067a201977e8si5502889qvb.247.2023.11.26.16.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 16:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q39OZemC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7PP8-0005lV-IF; Sun, 26 Nov 2023 19:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PP7-0005l4-Ju
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PP5-00007Q-Dj
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701044590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/5hhuo3PbLrdJBGlLY57GFAX7PwJW1kv2rTLImRgnE=;
 b=Q39OZemCCotcl1sVulIufDXH0kj+gKbgfgitZCuVwJXerZadMQx6oig8f9hSOEtRdDxhGd
 85blPjahDuMqqumnVmRPwILfJEl7lOtCzg7V3DcqtxVsVF1pRvYn/4ACyXiBAn7oNzV6bQ
 tz5FNZ2ym4XHA9UR0N4/q+IgWlcyDNw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-1uu7TkfONue0p8xW04RlBQ-1; Sun, 26 Nov 2023 19:23:09 -0500
X-MC-Unique: 1uu7TkfONue0p8xW04RlBQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2855fed424dso4805829a91.2
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 16:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701044588; x=1701649388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/5hhuo3PbLrdJBGlLY57GFAX7PwJW1kv2rTLImRgnE=;
 b=VaQ7U1HvGzgJ1dpVoGXwCrAW07f0BQHe8zg+a0uRbKUvF7TNvm8zqMVUK+F41Uwlkb
 qYkMEObpUsxVvXE2iBwP+MG11a0mZ8bV0vB/lTEPNtzrX4z9U/Cil3izjd+OuLvT1aiM
 /EQ10vFpOQDZ7aIoEgwD1IVLVZSa2yygJFofHMB3NRPcnLmxe7ax7FpYzWIjVM2pUl/D
 OFH8okH8/AAIEkl6XRJv5HwivJy5anhbZFPsm727JadIw4TbWc2rL7dZmv5Mvt+6eDea
 mg2m8Xf0CSzyJkWFvPslZi4WplDdzgASItsG8F9u/R2Qp9Y1qVHHgZVTBecm8tBDBfGr
 0L4Q==
X-Gm-Message-State: AOJu0YyurDCtEogK/lTU8xRK6wc7noa3ZJUaEpkEzkCTt/afrw6Ykg8I
 V/R4GlvPriW7w/NSomzLrHLvqtGz0WygBh9gbE7S7Pqmk11kQp3CNTMOoQnxLFzbAm2qpeb/IeR
 JWZouNy9MQlXgak+woJAz
X-Received: by 2002:a17:90b:1c83:b0:27d:549b:3e65 with SMTP id
 oo3-20020a17090b1c8300b0027d549b3e65mr10237641pjb.49.1701044588151; 
 Sun, 26 Nov 2023 16:23:08 -0800 (PST)
X-Received: by 2002:a17:90b:1c83:b0:27d:549b:3e65 with SMTP id
 oo3-20020a17090b1c8300b0027d549b3e65mr10237632pjb.49.1701044587907; 
 Sun, 26 Nov 2023 16:23:07 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 ob14-20020a17090b390e00b00285a17f9da1sm2901511pjb.43.2023.11.26.16.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 16:23:07 -0800 (PST)
Message-ID: <cc2ab2e8-452d-48b2-8e9b-1100a2c785da@redhat.com>
Date: Mon, 27 Nov 2023 11:23:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] target/arm/kvm: Unexport kvm_{get,put}_vcpu_events
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-20-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-20-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: bKitqEAVXaKE

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 20 --------------------
>   target/arm/kvm.c     | 20 ++++++++++++++++++--
>   2 files changed, 18 insertions(+), 22 deletions(-)
>

Reviewed-by: Gavin Shan <gshan@redhat.com>

