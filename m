Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp648908ejt;
        Sun, 26 Nov 2023 15:51:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ5xFuVbVE7xjkQE6UtTr+BvNrWf4Q9qRPuBSoTw5sQf8Ypa51laAu1WjPOkFMwk99Zvg3
X-Received: by 2002:a05:6871:1c6:b0:1f9:5fa0:6794 with SMTP id q6-20020a05687101c600b001f95fa06794mr11484718oad.59.1701042679762;
        Sun, 26 Nov 2023 15:51:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701042679; cv=none;
        d=google.com; s=arc-20160816;
        b=cft/JvTLVDWuLb/Glykq/I/AoxmFqaTB/aym0yZlHCrF1Gk9kiUF3jALG83EBnIvdO
         cvCGuLMLPo8Gipnl6wr4qSduXqSjtiejYw9WG/0SS6Cb2vluDVYpa3SnJkA3uQz/aNwN
         RG3Cl13784d6U/aevgQWbpqf3KmLIDLGNfWbwAAwO3h8HZfvcI6wk5JjitSw8meeLs1w
         dWU9AN24+pxLvZ0E3cw7s5jJ1matUo9fUi2e5gfywp2/gmoGVqPzbS91uFoM2YfSRIMd
         jB85XHlgHx4Q3NSw3sRiA6w44fFJ8CuB+d1HikBBpa7XWqOouL++wfBqYfBv821fS3C3
         r83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pr+A82e750c5TgcxUv3ChGYDntJzvYRbOWfTYLKSo6w=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=IbNBRRpc0dfR5Umog6JnZb2IpsKNkUWDL/FKAwsjfO/v3BrQ6Z0Q6J3Mo7AwCBR9p7
         xmPX8gPxva6Y9emTszQg2Swpp3hQ0thwgy4/Kf4mZm3WqRLwvWoFsmIYHoOyuB5bm9Tl
         vV11PJNX44FSaPZtNCFqvwyMG95W9s4RY/kV+Hs35hLWsLnsc7Re8PL/eV9BehAeQDIE
         OXpLyKDXt2grjkQ96aAqB1LEvBPIEH0pUOS+96DrP7ExErAGkXRKKHRrOzW7O/TtblYN
         Dag9LSEAMZcKJKroig6Vj9dBq/tfQRgb+qNEvMRJhZngmqe6EN7lF0ttyCK6MDOvoJDP
         7CwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L9pjUN2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a05620a167100b007742f841ec5si7929542qko.383.2023.11.26.15.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:51:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L9pjUN2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7OuB-000105-W5; Sun, 26 Nov 2023 18:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Ou9-0000yC-QO
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:51:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Ou7-0003r0-LW
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701042671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pr+A82e750c5TgcxUv3ChGYDntJzvYRbOWfTYLKSo6w=;
 b=L9pjUN2D8443bbT1b1WrTS5PkUvfZQK4x9YV9QRrN077P4V92Idu1qbmh8fdC7k2lcLtNB
 yW6yZQZv1/IRlDEsphmVsvW0ZZLjt86KbW2O7H4PAnpgmbBaz0R3Sw8DVmxKtKYth+JWYr
 GfDJZdTqoV49DyERNrAYejeqZsEVY58=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-LrnfmxTvPSOKUM2xNmvWlA-1; Sun, 26 Nov 2023 18:51:09 -0500
X-MC-Unique: LrnfmxTvPSOKUM2xNmvWlA-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-285adda4d3dso1793352a91.3
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 15:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701042668; x=1701647468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pr+A82e750c5TgcxUv3ChGYDntJzvYRbOWfTYLKSo6w=;
 b=xNvkpjCasVLMv8u7/k3SmC/DV+B2Rl9CzIeXupWq2EUQHO3MdqK645U8blmQhOo+yM
 Mf9LsU6d0Rgx9o/HZ88kr+bedhHw4L4FlCJGGdTXSv2kdiy3n90fGOGBpPgc6B57HPWT
 wuD6dVUoMTsn6KYIjI8NZJUwcbE0TWhAt7iaBIyCXICZVOGdjUAFR1N4w7bvrCNyGJ7H
 7+IhHs4Medny6nLexUbrGc+b+kLmc0Awg3W6aoj3bJOe78EpNRi+goMvWNuER7XReP1N
 NBdSg0LFF+bdgWOxCvHDFPkQ8rpxyG7f/u3vCsNPoeNJydRbzVVfYY365BY0iIsywNOz
 F6vg==
X-Gm-Message-State: AOJu0YzLVoH9uunqqfhF5h/QmNMad0idtqIIxnX+EC0+RmcewdnmLAPQ
 IjURrkZW7UEj7AJCtf7s6CHuwLRf96VX4a105m6n6HUc/vOHkBOs+qpKQ7M6RgyNRnkehRo36gF
 SQ/JCKIG4s4yeYNAlpIa3
X-Received: by 2002:a17:90b:4c91:b0:285:bd52:32df with SMTP id
 my17-20020a17090b4c9100b00285bd5232dfmr1696910pjb.30.1701042668438; 
 Sun, 26 Nov 2023 15:51:08 -0800 (PST)
X-Received: by 2002:a17:90b:4c91:b0:285:bd52:32df with SMTP id
 my17-20020a17090b4c9100b00285bd5232dfmr1696907pjb.30.1701042668192; 
 Sun, 26 Nov 2023 15:51:08 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 fw13-20020a17090b128d00b002839d7d8bf3sm4723550pjb.55.2023.11.26.15.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 15:51:07 -0800 (PST)
Message-ID: <356fd7b1-4a0e-47d3-8efb-c919965a09b2@redhat.com>
Date: Mon, 27 Nov 2023 10:51:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/21] target/arm/kvm: Move kvm_arm_hw_debug_active and
 unexport
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-7-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-7-richard.henderson@linaro.org>
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
X-TUID: QL9j6mejz1va

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  8 --------
>   target/arm/kvm.c     | 11 +++++++++++
>   target/arm/kvm64.c   |  5 -----
>   3 files changed, 11 insertions(+), 13 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

