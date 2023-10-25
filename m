Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp2629ejb;
        Wed, 25 Oct 2023 16:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE693f09wSTNzXRLYS9sr9xNHcCLtprJTyn+03BwGeuawl5SaB4IwQV24Q3TpNaVyPNxgF1
X-Received: by 2002:a05:620a:4bcc:b0:76f:1808:997c with SMTP id sw12-20020a05620a4bcc00b0076f1808997cmr14380949qkn.20.1698276265314;
        Wed, 25 Oct 2023 16:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698276265; cv=none;
        d=google.com; s=arc-20160816;
        b=ABtyeBMmMmXB2zhNhS8QVHnmIa0TbS16uyBVhQVccAbpssf4F7jHw7WUB8DHbRp9d7
         RiAaQRHKyaJuGdZflEGUJhhGdU9ZHabJs9sdiiIPUccwsj85u4o3M5EMrG/u03Vs41oG
         FoG+JMi6ISVLwgCh6/qEwlyLC+P1Pq89mHPHUMh29eCC8BVmHI+0lCYLizH1aLQCaJX3
         nDBJfVusvxYgeFWPNooyFmqjDadijyXkbUjeQ77lsm4S7JQ9zzpfec+oXofdCsBhOBRB
         aS98DkzKh2L1T8hIySBnlVph4i2SU9M6DukFm0ztx259ao8ribdAqkHdiMg+ofWfYNZA
         hdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YzUOicqAHZtKpGRgbqgDSyXm04r78JXVYAf/cY5pEuk=;
        fh=Yotxlv7i9DhHFBkiLZVQ32wCHU8YRC4EwVYmglY2ej8=;
        b=SPn1bFrHMGvtHGWRnB6EZsZHhboSWYwxEWNorfIcBfZnVshBzqX2O5HoPVY4gPQkkJ
         PgId7+MOkcfm1NdKrTupIgQRi0ewX4azg2FFqCS3eSVBu+nMW+JHx5Yu4lJxhmfHNuTP
         +m1ivubcA1JlW0XTpCWDcVkQ5NbttoI1+/kKPlgjTaB8lBz3bueeEQVzTfxuwDtt9VLK
         I81PqnUuafzDJU4+Kqmkfn+QlP1ZMZtv5xzjFOwhIqrX8KeFsTHiem6Hpzn6wVljUzgY
         ApPeDGgKdYxUH2+qlEGRI0J5E485bGnFX+4gLkK2RC9leswk/VL13CXRr7wkN7W6mFID
         P5Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHLywVn8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05620a28c400b0076801d54d1csi7970617qkp.642.2023.10.25.16.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 16:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHLywVn8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvnE9-0000AO-L0; Wed, 25 Oct 2023 19:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnE7-00008D-MT
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 19:23:51 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnE4-0002oo-Jx
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 19:23:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ca72f8ff3aso2060305ad.0
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 16:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698276227; x=1698881027; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YzUOicqAHZtKpGRgbqgDSyXm04r78JXVYAf/cY5pEuk=;
 b=KHLywVn8XWKE0rflxDh+I26tlshcJHJAwlpVtcUKynni6PmUOfPyhzsF+aH8JDu3dJ
 5RtwNqHhs1DSf8ehnajQR1z0ymI9314AvnusDbBcCFpCMAG6SG1d8XKOS7ntIVy2cCl9
 r3mC56p07NvgrKq/ScIMwU5Pl/iGf7aOmDb2vuNjiLZ+JioslF/x4qxPLQx1V3MMCD6l
 b3WGRSBHnt26M8HC/jY4FKfooSFhdgDl1KXJCqJqzLfaOj+jPksjoLtzsKgupH1BByvo
 +gy7jtWTPbTGnZ/Vg9PYWg70qJhVIreOB6Rbjn8XYzvTXavJjjZYgaf1DenvFKHCCAOp
 un6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698276227; x=1698881027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YzUOicqAHZtKpGRgbqgDSyXm04r78JXVYAf/cY5pEuk=;
 b=dirDTgVhThdP1nMZJ0uNozDtKEWDs8UzmM+r78xBw02kOb07uuwwjtZifzH2VRILDy
 /NLj6IMkbH0d2Em6Csa3zDj+3+VkSub9mlYf4NppKxmjE8GamygR6vlUa7ipNWdzTX/c
 qH03lLZ4RJjp3078C1/8giz7pVQvMEx4KP9pxieqE0Ds+BUaub2YTL/ttJZS5lYRcsXM
 +p//wUk7yI+/Vbs9If70hu6tZNI3SuTCbpl+CjVws7NhKDrbPZkcJB2CvoLoYO++kwr8
 XrP6gRD8xq/l5EAGy5uVsDlZvZQkd2RiYf0k2BVYR5DL5gs0fKRdVlEKzdjhlwUBa3f+
 XuaQ==
X-Gm-Message-State: AOJu0YwQQk4ZxYiGYQO7W5IRcD6vZM3cueBQt+OC/KEwxM/Dr1C/NoTo
 IiW2650lnhDQQWHxJ9Vx4AupTf6qnyxidYrsBmI=
X-Received: by 2002:a17:902:f988:b0:1c3:2df4:8791 with SMTP id
 ky8-20020a170902f98800b001c32df48791mr13293281plb.27.1698276226918; 
 Wed, 25 Oct 2023 16:23:46 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902680d00b001c0de73564dsm9926456plk.205.2023.10.25.16.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:23:46 -0700 (PDT)
Message-ID: <f4c07e08-fa8c-4876-9867-1ae661e290e2@linaro.org>
Date: Wed, 25 Oct 2023 16:23:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] hw/arm: Move 'hw/arm/boot.h' from header to source
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20231025065316.56817-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yH6znYLgaWqG

On 10/24/23 23:53, Philippe Mathieu-Daudé wrote:
> Almost no ARM board header requires "hw/arm/boot.h".
> Move this header inclusion to the source.
> 
> Philippe Mathieu-Daudé (10):
>    hw/arm/allwinner-a10: Remove 'hw/arm/boot.h' from header
>    hw/arm/allwinner-h3: Remove 'hw/arm/boot.h' from header
>    hw/arm/allwinner-r40: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx25: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx31: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx6: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx6ul: Remove 'hw/arm/boot.h' from header
>    hw/arm/fsl-imx7: Remove 'hw/arm/boot.h' from header
>    hw/arm/xlnx-versal: Remove 'hw/arm/boot.h' from header
>    hw/arm/xlnx-zynqmp: Remove 'hw/arm/boot.h' from header

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
