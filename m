Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp61907njb;
        Wed, 4 Sep 2024 03:10:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUGGYkj8i2/HRrbzcu4YMOYwyIy3dctbpU3uujJ55cHXG+wi+ZLGdMMVqH1Fm/Kn8/3tzg43vJVlFbsA==@linaro.org
X-Google-Smtp-Source: AGHT+IE45gmlibWY25tW5RSvDg6MUafQwVQz9FtFK4sWq/5PKHwPZsODESi2HPFeWuB3PHUKzfDB
X-Received: by 2002:a05:6808:10d0:b0:3da:bc74:e9c7 with SMTP id 5614622812f47-3df05e3de2bmr26409997b6e.38.1725444617502;
        Wed, 04 Sep 2024 03:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725444617; cv=none;
        d=google.com; s=arc-20160816;
        b=TH/MFxZ71FLKtnzPPPKOTxPokzixStmBmbeWKbB+cEhSSkSTBMRtMAm1R8m8YYxEu3
         2+8VOV0G2I2De4lhMXH/Ju6djxiluoPaGOstcGzEfiX1qbKW+Uie5QpJjoD5FHhYOD0M
         fiuYn9bGghBoqW6KXNKhI3sa5VJxDLsAHHenNsjF1IqXm98QHLvPHapb1kdimxMJ0Su/
         BgVBfKdg8PbEgnfi4v/4Zk0zu9l84kCOM05bFkPqswlhuJ/IlUklOW2NVdEm5Vhl2/pX
         ImJqgQIOTkwJ+B/RRYmTTY9L7EH+z/u+ghF0ZYXeo22AanfmDBle2L2D5SAxrgIodHmg
         BwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZFocta2AMIm3khqRDE4miFhFEcXhrEmdL3WSW5B47Js=;
        fh=wf8SPfXdtnM7oWaNhJxCVHty/Ps++KJX8/pHWoeEjww=;
        b=jbfy5A/ftAi5EzXTpupmx83XdxC6Jg1l/nB5WUhcCNFS54z15Y8KZLVKj2ZtUP6LaQ
         FsW9JBuFMSd7f545SyqzvcZmhHxjBjck40q2ShkrNmnHGWgC9Uq4qJObb4qDY07Ll/ha
         JPAitJ37qcdrfpo0tl9tE3u4PITuVC5KEw0QQSbP+LaFqxeijnNRjMUTICjhp1pYwr8X
         OXVWCr/MuD8xqJ9S84Sm6BcPaBHaZvLC7ENSmZ6aAgFBI6wu1e+B/hV1LdgMYyd8j/YG
         rWIY9IStVhgJ98lDnvy9M2p485uEeakxEbSTR4WPaBX7WJ4yk/MLchf8XV2QEX/Xg/PP
         eJBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LR0WskRc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d3cf0esi151204931cf.293.2024.09.04.03.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 03:10:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LR0WskRc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slmxh-00019o-OM; Wed, 04 Sep 2024 06:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmxf-00010P-4P
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmxc-0000va-Vi
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725444600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZFocta2AMIm3khqRDE4miFhFEcXhrEmdL3WSW5B47Js=;
 b=LR0WskRccF6wg+oYuluW/N8CoQc4UV2CWY/4oyFASfAZ3y5J+eh7QtrWrcuDLqxdra42kT
 v5iFxE60CAgXI77ovS/5SUp2JteyUiEAuWi+N6RfieP7IttUjMrw8QEpPFZIHYspBkla/u
 CUI1lAYlKIVZTDKdOVOBv3bVhff6ADs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-KwyuAKddOdKcb328X1OoNQ-1; Wed, 04 Sep 2024 06:09:59 -0400
X-MC-Unique: KwyuAKddOdKcb328X1OoNQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bb2899d57so6164045e9.3
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 03:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725444598; x=1726049398;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFocta2AMIm3khqRDE4miFhFEcXhrEmdL3WSW5B47Js=;
 b=KBpV7wwZuB8C4mk7A9mRI9y7J8vOA1T9aLredQzQMEMi5pye+7L6A5g2gsQy93oABN
 06vXixr6zZe5mVNVNo65hCkMkkkwfCyLsUyWX08IjtfS1FYdRK80voWtwbIJUHOKjJpB
 159H2xph/+Biche2/sUzdHEN67d9HEMPoqrIKKny3pGGr8DfaoWkgs4rwqV7SNb0x2pE
 7sjGh4odcdDvhN8LSGDPkqic/3uf5ugLH2AVxtqsbpXjqoszeu8IeG8dnl58PXTVM6QW
 GkVE2tb72mwVqoblvpPxC794xOVAfZjDjebW86xlu5Ve+ZlPZCAw0X5Jsd5t0dtusjeL
 C6DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS04PenqwAm2WOgNJfHNOkhYzam5q0GcTYgYjqrhBzMLoGtJiXnFKrtZJIxlyXbi7TKrJMMnZ1nA==@nongnu.org
X-Gm-Message-State: AOJu0Yz/96wyFRhssz67gLJgt8CqcMGadYAtxMzXCFNo3sbxpplnYBdX
 NJYLydYP3pQxB225boeRUyrSZp7/+0GB6TJ0iGSkqc13Kga+Ge0gNLE06AZAfZ86bx99/bD782v
 qG2JPYHk9Ut/rEVDrZMX8+vhNGZjWgR8nyj8Q1ScZybvQ/efzrw==
X-Received: by 2002:a05:600c:3b88:b0:429:991:dd71 with SMTP id
 5b1f17b1804b1-42c954500b6mr13124125e9.11.1725444597832; 
 Wed, 04 Sep 2024 03:09:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3b88:b0:429:991:dd71 with SMTP id
 5b1f17b1804b1-42c954500b6mr13123965e9.11.1725444597345; 
 Wed, 04 Sep 2024 03:09:57 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba641db07sm232629565e9.34.2024.09.04.03.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:09:57 -0700 (PDT)
Message-ID: <5d11e69c-5a85-4a30-af61-aac6ff47ef4c@redhat.com>
Date: Wed, 4 Sep 2024 12:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 33/53] hw/usb: Remove tusb6010 USB controller
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-34-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903160751.4100218-34-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: VOU6NfWO4w4o

On 03/09/2024 18.07, Peter Maydell wrote:
> The tusb6010 was only used by the n800/n810 machines, so it
> can be removed now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/usb/tusb6010.c  | 850 ---------------------------------------------
>   hw/usb/Kconfig     |   4 -
>   hw/usb/meson.build |   1 -
>   3 files changed, 855 deletions(-)
>   delete mode 100644 hw/usb/tusb6010.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


