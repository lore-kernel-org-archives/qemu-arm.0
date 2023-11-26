Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp644117ejt;
        Sun, 26 Nov 2023 15:36:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDKaRyG5Bb36Lcbkcn/o5dYTfnlODQlaZ+n177uVSB+JNwAupU13uCf3h/WC3Mn0DZQO+2
X-Received: by 2002:a9d:63d7:0:b0:6d6:3ebc:73d0 with SMTP id e23-20020a9d63d7000000b006d63ebc73d0mr10376765otl.22.1701041801916;
        Sun, 26 Nov 2023 15:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701041801; cv=none;
        d=google.com; s=arc-20160816;
        b=CQ9T1ks/58W8gUISzC2063b7N4yoamB4clGcQNNkKmspXm6emEspI+DzG5d8mFQGyK
         VzD1swtc8JMZ8edyte63hB/kodiMyFuHjgmTY+6EvK2KcDgaQxRQBXlXXNzHvoWjMEB5
         geKkzn5KZ4dXzbPp6tyCnRxQ0B5IhgO5x7+DryLmds8CnJviDkbNfPvUo0WVQ/hR7foq
         IQesZKzDvSBx9zerfJBE5A/bKkPf9acXu71H5bh7j683UUN/PEREJCrptMypcgS4VBTJ
         J1hgGu2KWMSpBpSmTR7HVEhfkU3OhKfs+CNKk5G1m07r5bAd+1DtEwlEqGlQfBB4s5U0
         oD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pZu0i87548G2mYL235eTaRtByfSrsrcgVwdDlySrJV4=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=uRUtKUdTNJptLfFgTtmQkeMfPfbtt3y0Pfm77rkdyDM817X/SUZIv51460zfWjUIRH
         zp+9cXxvJvn2QkccBnvGnH1Djts5F6SXggskE36d2FgCZ7SEJtoUqKwtWSQO/eCtzZ/b
         Yat+UblrH8qkZv415ZCifWeQFYl7q4xH6PJacBICqzEZtjlBi/a8MaL5m7slB9RkI+d5
         nEEhapOYC93tQbmi44nWvkDy+/GNlkwidKYjVw3yfDc+7dLQcxyEnbBGOn/Muuh69U5L
         16kscKIQYuzGi0f9kwejqhWWrst05zWW9wc6YOtj+ljORWgJahrVm2WkCdL7TDWs/dlI
         x6og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PV3eLPjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a056214224a00b0067a406ef628si1541936qvc.333.2023.11.26.15.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PV3eLPjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7Ofu-0004Hx-97; Sun, 26 Nov 2023 18:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Ofn-0004Fo-4E
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:36:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Ofi-0001WV-Gh
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701041768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZu0i87548G2mYL235eTaRtByfSrsrcgVwdDlySrJV4=;
 b=PV3eLPjzBgRvvGVfhmSq7Iu1iLi2X8ihBRFlx/oyVv6NbVOp5O1WTklhE0tpB79DX2FPzG
 eWouWLZdz5J2ouU/j5YQSdB6D7EoSflo2/l4SfettKlAkE5HJ/OS1xSzVCCL0Pe+vfOjr2
 nb4IgQ40rSH0sfTf2RA+Ye/pyxOnDs8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-KKMhSGM4Me-mYXY6zWS89Q-1; Sun, 26 Nov 2023 18:36:07 -0500
X-MC-Unique: KKMhSGM4Me-mYXY6zWS89Q-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1cfb5baa409so20586155ad.3
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 15:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701041766; x=1701646566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pZu0i87548G2mYL235eTaRtByfSrsrcgVwdDlySrJV4=;
 b=Ew/X/ShIcyEavgL+hbImmi4Ba/43gTX+1cuzs4OzbJOnC/pT9fOfvd+OnKQK+SymcX
 nRiDaZEbFENeEEi+bZjCDPJTex7Rl69/dVk73WcuJSeFnTUK40Gi3gq/084SOhgFDdYV
 ymn4L3eYmidlbB8YbI3dGsO5KyrjpIASW+39Od85Nw3T7o7WcXiYbXt27pBP3VJaigB2
 Ka8lnJHcQVpF78qgpEYPZrCIYPRae8TQfBIgIR3Pi5yvGEspoRlruxJ17flmN9hDZ7NP
 7bvgnVUYHi/InZflw6R4EVjou/4hyGfwTnfPgVHLUEhjliMndYld00an5S7mTzG+1wP0
 pM7w==
X-Gm-Message-State: AOJu0YwEzLUo3orNmPqVg8exIlx8RFkbirQ9oFzw2JCIb6SriMFTl0vT
 vytOrNMHVARfMTxBaWukgua5q0hU+noE7/M+2fn3fkU3VyNYOjscsGyxkUsCHJc4Zry1MNdUz2a
 04E1fYTRAl/Vm
X-Received: by 2002:a17:902:d88b:b0:1cf:7666:4dd0 with SMTP id
 b11-20020a170902d88b00b001cf76664dd0mr10437869plz.39.1701041766114; 
 Sun, 26 Nov 2023 15:36:06 -0800 (PST)
X-Received: by 2002:a17:902:d88b:b0:1cf:7666:4dd0 with SMTP id
 b11-20020a170902d88b00b001cf76664dd0mr10437858plz.39.1701041765850; 
 Sun, 26 Nov 2023 15:36:05 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090282c700b001c5f77e23a8sm6849908plz.73.2023.11.26.15.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 15:36:05 -0800 (PST)
Message-ID: <4a9bb2a7-cbb9-4fcc-b608-3779084fcb62@redhat.com>
Date: Mon, 27 Nov 2023 10:36:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] accel/kvm: Make kvm_has_guest_debug static
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-2-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-2-richard.henderson@linaro.org>
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
X-TUID: 67IgA3m6HR4J

On 11/23/23 15:41, Richard Henderson wrote:
> This variable is not used or declared outside kvm-all.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/kvm/kvm-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

