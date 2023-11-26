Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp650230ejt;
        Sun, 26 Nov 2023 15:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNxlwpkOq8Sq77nufa/kG4Ero7eaS86laE8FQBVcUBPn5BhpPdgoWWSRJqoukODuwbq7Kw
X-Received: by 2002:a05:620a:3954:b0:773:aa77:91d5 with SMTP id qs20-20020a05620a395400b00773aa7791d5mr19177461qkn.33.1701042943195;
        Sun, 26 Nov 2023 15:55:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701042943; cv=none;
        d=google.com; s=arc-20160816;
        b=Acl8ufD1viRkkwWVnDG3YQxL21WewVew+neEZa2KQvjUCzhjSuQ65hc4vloo+rb5jL
         U+cnOPtSvUNnoBg/QCoBTVQu74yLNMXQWkU7IfGWYxcT5pJZ3aCdgXJ6yQxNFWMl+S4L
         GSue7CWW0E5AD4x/DAeYkC/VRNoIdr2aZT0v3x6eBegMN7tQBgtKS/Y26wsmM7fcRgpF
         +2ZK/2O03CuqU1kGgoNjeCUk87lTJoUF9OfdYY2pfHvAVVD7sgp4oga7FxX3utLonXX+
         pLVbt6a3tpINV3v/HjT0KhQhwDOJExnCK8Zy2dUMemRZi6XZnqhhOXj0hy4YSKR2QoBk
         SEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RxfvYBKXypDKKOJdtBdCSrtt2NRiDyHztGG2xsCdrEI=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=x+uFeEn8Tmk2Duoi0SAeR+HSr9+YQONYm2uMG92+fQPn/BT6bG2si5tUVce0IVovOl
         xJQSIgwlJwPB3odqhQ/dpmq9LC3FxVyOKgvEWoS58By/3A2YefN9JaBHghqwedfJDkjd
         0/8DDYWMkvFewtascK9Bo99XzBy7aJxmvvYkWpVilCwAZG7MLXWkFcjViYwTdGxUIBaG
         mT/gZCC79OeMv+uV75LA2dJ8T6bcAnKjDcHMd9N2CIxDaHJzJl5AP2ZD/tDLxKAIxytf
         3TfaXhbbqtnOCdBNNocZWKDPSSbcj6dTyS8M2zVfIVkxozc7P1QTaiPKF1j37qZ0n9sf
         iPPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J0sEHI8L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ad44434000000b00656be4c5847si8206235qvt.37.2023.11.26.15.55.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:55:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J0sEHI8L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7OyE-0002gw-06; Sun, 26 Nov 2023 18:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Oy9-0002gI-HF
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:55:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Oy8-0004Lm-3S
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701042919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxfvYBKXypDKKOJdtBdCSrtt2NRiDyHztGG2xsCdrEI=;
 b=J0sEHI8LY936uN/Mh1PxO9dCuLQwUoaHyr4EncWvzQT6WdNQQ7j5KZG8WM34LBtKoA+YlW
 xx4NHZBw4en4m+kML541Z4TgCr9Lyi+gcdTiDsd8L+qZ66H5UjIm9ai4iereK9jYBbdA1A
 VLVFQACJli6B1+Ek2EpUzuNCLRVK3YA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-MpPPwuocPzeQqiv4-yIJ_A-1; Sun, 26 Nov 2023 18:55:15 -0500
X-MC-Unique: MpPPwuocPzeQqiv4-yIJ_A-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1cfc2a7e382so11389015ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 15:55:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701042914; x=1701647714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RxfvYBKXypDKKOJdtBdCSrtt2NRiDyHztGG2xsCdrEI=;
 b=xDdEPjLouTJiPHnkmcnmvKzXYubxjv7O5QoD/9QWlOx6WTIjOWrvApmzfCTxhiPjdE
 v6dv3Mz/EccRwyhWPrzx91PN+BvaAvj5+YH+kMa+ydVROQyGA0VTaPaCkJxNBE9eUD0i
 0CUfaNNPx/wnC8Hv6BfHdZw1wSrRulnxeLdHCcDbwQ30tHu9I7UEyuBdojOyhVcF0LTF
 eCOkgN7xP8nLjfVtTwEQIIsJqOPGRYwaP8o47Zt+kcEhXdZqFE2PaKNwCH89CLKj9I2R
 erhX6Z/yusfK5g1xSYdthhJO+5yfW+dWWFzJr5I4fGJUACa6B+SZ0AF3eam1fGZkgmon
 zsrg==
X-Gm-Message-State: AOJu0YyQqVmCyqu09zZUq225yg8EBbxD00GS9YHBm/m/a+7L08R3Bpcs
 7wvOExbdEj2HJ+hdClhaJxLXb/bHVh6N62qlH9TjpDzqymTaSMFJikJSL+fdiCswZHy2o9U2oPG
 Pv1GTcbNTREq7FtRy6hwQ
X-Received: by 2002:a17:902:cecf:b0:1cc:31c4:3426 with SMTP id
 d15-20020a170902cecf00b001cc31c43426mr13001832plg.11.1701042914696; 
 Sun, 26 Nov 2023 15:55:14 -0800 (PST)
X-Received: by 2002:a17:902:cecf:b0:1cc:31c4:3426 with SMTP id
 d15-20020a170902cecf00b001cc31c43426mr13001819plg.11.1701042914403; 
 Sun, 26 Nov 2023 15:55:14 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090282c700b001c5f77e23a8sm6864887plz.73.2023.11.26.15.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 15:55:14 -0800 (PST)
Message-ID: <bb0137f5-6de2-4079-a4ae-736eca4f4788@redhat.com>
Date: Mon, 27 Nov 2023 10:55:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] target/arm/kvm: Unexport kvm_arm_{get,
 put}_virtual_time
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-9-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-9-richard.henderson@linaro.org>
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
X-TUID: y/gIs6gL2Ebd


On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 16 ----------------
>   target/arm/kvm.c     | 16 ++++++++++++++--
>   2 files changed, 14 insertions(+), 18 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

