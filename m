Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp647724ejt;
        Sun, 26 Nov 2023 15:47:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9PflTpi3Ly8kWO5E4+ra3qfOWhrKg2UWaVobbiUIVaw1u1k0G1x809CwmsIHmNtFDu2HY
X-Received: by 2002:a05:6102:41ac:b0:462:ed64:a28 with SMTP id cd44-20020a05610241ac00b00462ed640a28mr5179121vsb.23.1701042441290;
        Sun, 26 Nov 2023 15:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701042441; cv=none;
        d=google.com; s=arc-20160816;
        b=tDqNxruHlDeqLqweic0JZFmKgyIUSdxDRfMj69Ou5/kMHiW/xKM0HyQtmcRCLvhwMX
         OCqxPXVS6gUTt5mWLGrdV6h78IHW43z+lpjgtSxpm001v+pisVefwluxKjN14hLmQqN+
         WNPvaKAiwdtZHnqxbn2t8EKRM7w8m7pVFDG3F761xF8TqURqDXuZgoKdVsMRnz5YQPYL
         +yJB1f84oMLdEHrSfgF1MKnK5tj3tbCv6IugYxUcSpe4hP5jqpwi/7rYglQTX5/8e5Lz
         fGxnTDX+kEPEWYRW/zN+z1b9ZS4uDKHZOJeJbt9pK5ScdopzH4QaixisA3pJQAenrnyH
         OnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=02LKGz5VoGfr9yBKlb+J5KTlyaLOTpS3Dy3xhbCLpE0=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=ibrSIonzS2vDYNSCKEtaORqlTVCskl6Il4T8I6hf+U9kLyEqeX8kexwB6eYzbmuzEI
         YA+lqMx55sIUYSWsDoNpNLGf6Rs0ZXaDHlwhM0axvLmX7kPsd7qiXB3KFt1TWjZHji2v
         etF4/HGxa7EX52xcmUsigyPW02Urm3FEVZuxqcTtiEAJYqlITs1fxDziz839MLKxI16J
         OyRS2XNftLDuTI0h84F/WmIklLSVKONtfgO/AslDoSFh7VOVhVNA+QS3FxgdVSSPImnl
         5IG7o+GsT9qfVlwSMNLYiW3FczQ3jKTMSiPg0xTjVUANfyUNG2ZcAewYrQZcgJfC6VH9
         11/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fI2Hj3U/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05620a430a00b0077437859066si8147699qko.7.2023.11.26.15.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fI2Hj3U/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7Opt-0007eV-76; Sun, 26 Nov 2023 18:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Ops-0007eG-4h
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Opq-00030Q-NN
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701042406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02LKGz5VoGfr9yBKlb+J5KTlyaLOTpS3Dy3xhbCLpE0=;
 b=fI2Hj3U/pZ5Z3kf/Ao8Thp7ofFOVcg9MclerAeO1fxtR/mDvUbGgJmRcsBtGhEGO/bZQjT
 fxOSgWTCgSpJGdi7qVRkAIb1fYVy7GWvEA9mCi7ytyV49shFzaQ1ix8hZem1Y71CIKf40n
 p3aoBs6XFRqeQZTcgUMVg3faZzK4awM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-cwuex9R0PyGYXlOz8CkSfg-1; Sun, 26 Nov 2023 18:46:44 -0500
X-MC-Unique: cwuex9R0PyGYXlOz8CkSfg-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6cd855b6003so808633b3a.3
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 15:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701042403; x=1701647203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02LKGz5VoGfr9yBKlb+J5KTlyaLOTpS3Dy3xhbCLpE0=;
 b=tlaL8hNOGYl5u9MMdIOvnDTmIV7ktFDd8D3LDBBfCAZE/cAlbjhSfg5dZKC2sliP2O
 KWseTMn897lT0vypYWsm/N+fTTCsTX6F1Wc6+rBrB4DtSnxzJkFfLhZ63vSWrFgOIDrS
 BeIQwmu5A7M2D/h3Q97UekNPmjMrCo6Xn2ot5voJi3o6juElgrXMF/DBCAfQ0T6GGNZ7
 soEcoIKESOK54Z4RwmxV3LEmD4TMXqBVv77E3NTyQ09vIlS3yiZStPPFmuvjwANukYPG
 JFa0dIyOBBIuQFpPZHF+aa8ge+fSWpwazx+SPw9ZPJTjEuxtwZ0As1IOXaDAD3zWqePf
 vxWA==
X-Gm-Message-State: AOJu0YxW+zNyddXo3sPlFZWECa4705M7sgnmdXNwciC3abk5WRGTk7r8
 BXLhRY8kXxIzqAhAPb685qcCd3ccbyD0jrDnaKRmHN40IUcQw7U05nObZQxY2InuKamRe4KtT1N
 ioqhPDCNWfCq9
X-Received: by 2002:a05:6a00:2410:b0:6b4:c21c:8b56 with SMTP id
 z16-20020a056a00241000b006b4c21c8b56mr9532942pfh.23.1701042403686; 
 Sun, 26 Nov 2023 15:46:43 -0800 (PST)
X-Received: by 2002:a05:6a00:2410:b0:6b4:c21c:8b56 with SMTP id
 z16-20020a056a00241000b006b4c21c8b56mr9532931pfh.23.1701042403384; 
 Sun, 26 Nov 2023 15:46:43 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a056a00194c00b006c4d4d5a197sm6199877pfk.171.2023.11.26.15.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 15:46:43 -0800 (PST)
Message-ID: <fc993a45-69ba-4abd-8291-4fb701f662a2@redhat.com>
Date: Mon, 27 Nov 2023 10:46:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] target/arm/kvm: Move
 kvm_arm_verify_ext_dabt_pending and unexport
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-5-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-5-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ls3G3VHUtBti

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 10 --------
>   target/arm/kvm.c     | 57 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm64.c   | 49 -------------------------------------
>   3 files changed, 57 insertions(+), 59 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

