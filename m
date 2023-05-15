Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6404443ejq;
        Mon, 15 May 2023 03:22:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5J9RZJz5kuO+YG/d+7qvQgbjInfLSdz8WnvrLf37dFdyTCIpY7W7cV2nmMCIoL2m0zPU73
X-Received: by 2002:a7b:c848:0:b0:3f4:2a69:897f with SMTP id c8-20020a7bc848000000b003f42a69897fmr14301877wml.19.1684146152493;
        Mon, 15 May 2023 03:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684146152; cv=none;
        d=google.com; s=arc-20160816;
        b=QgIrpSKNjD3gvVoGsS4e+0prcztFZwnSHzWzmrwrUS1laGiAydTIy+tdkYInWJOqyi
         cVdhjjDt5Gf3cn23Vg/VfSH44VD8WcxIJY14Y4wdh1CmHIVLw/vzkzch9CZXJr46PNeA
         9Uqo9vN7rCqaE7tKgAeuQJHIjAt1fhA+Lku5QB5Iyup+25A/XEzml5/3z22x14XO1iuB
         ySU8xJt3NC0LvBJQihI8leerBaf3D7a4VrBzIkyDZSTUlKpEAKGjqkmOBs6kZcqE3wu+
         SfsTnBFYz1+Bb0v5VRiyzrn436YxRYQJ+UdoZ+Yua7Nz8EeoK7FCvCGtvLfuFp+BaEhg
         gQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z39OO44K/Z7hO/l1sxJgSzfVYg5mQg7l3OK/8e4gJeA=;
        b=hwEwfJP/QcPorC0oWVZ1Kn/Rev/9q0P9bGGTip5TMpdX3Z6nzGnpgMKeXGATN69sbq
         H8iEvHPeEfXvyx1NWKFXIPXBLa2B7uM0ExzAZ5CDiqhIAVqTnUYsZH/Sl6k9iQkqd23P
         G9tV+3xBlaqKA4pqk4RXRcqZpb5hYpf0jZycSYm/aWE9ZS2CQzggnV25gllKQXDYGUXJ
         WQFKhkMRbobjwhXfMgxCYQHWuFlyzRynI9WEsprmM5bfN6ZnGYsRUB7HCqd0maDJZ2aS
         nlT/Q/8meHmG5QqgNLzmdPU0XbwJU63LK2Kq6zQed+azYfaC22nhvoe22Kkh/h4rElN6
         ePqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KCOuwvvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020a1c790f000000b003f427cba191si10464324wme.23.2023.05.15.03.22.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 03:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KCOuwvvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyVLL-0003AG-VL; Mon, 15 May 2023 06:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyVLE-00039H-Bs
 for qemu-arm@nongnu.org; Mon, 15 May 2023 06:22:10 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyVL8-0004xU-74
 for qemu-arm@nongnu.org; Mon, 15 May 2023 06:22:07 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac785015d6so131927831fa.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684146120; x=1686738120;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Z39OO44K/Z7hO/l1sxJgSzfVYg5mQg7l3OK/8e4gJeA=;
 b=KCOuwvvtgpgeTtr4isbcnBb45HD2ntc3YXPZwupkFYwYvKZoTUNOXn04+s2/T49Rr+
 SAKzDsAUmOc9OFrfiA2tYfWsyF1bfDJFLFH0vbwslUKgsJnIf5uI3vx+x6fBhfmgYSzX
 9MIwWnvGe9s5K5Lt4Ko7uqM25twthDLryWut+MS118pSLCp8bftpnbINuoc/cR4FRYLG
 6Z6LoSqusA0rUR+ie7yfUMRw2+6P+HekU4IyszmnYE1qpLX9AE27GRrCssCaj+8MhUJU
 /UUXjWKohmHSjiSGqwKyE+q9d+sljfeQSGt2AHJZSGzdYXi8CiQfZLqNMHFKDQDeG4O+
 YMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684146120; x=1686738120;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z39OO44K/Z7hO/l1sxJgSzfVYg5mQg7l3OK/8e4gJeA=;
 b=USGHNIJb6bcIc9ljXAwRX80n7+S8zn3/oPPXm0W4OOtF9Ueh3z91lfWiaPac4CCDM+
 k2hG1YFYKeSpGCiOj7G6IiDwkNahFn3hiAFvAW5rACVjl0YxZgcYwQ0YFOSNZMB9ePpU
 cW6XU9WZxSZnby1uSinuS9brwiBnkFom1j4dP/+fnKh4NfXV6ai6kFeysjGO+VOX/QsV
 ivisZSpktk7CurgrKjOvBTEBjT+pirQsIvuRIclbIsH99bH1gXuiBVv4m8gf8oh6Wud/
 MyiwZbmVw5OEEbiMhbruHNtqQEq3zU76yMpSDzLTPQoLc2OWBjUCDz3cnaE9fV99IuT8
 h5tg==
X-Gm-Message-State: AC+VfDxBy5I2tNpAYjmv/Jr6XzuUjMGayamXZ4sFvdN6OcOHqfRx+Qkm
 bbTjQlMa9FVrhlAAsUvHnfy0uQ==
X-Received: by 2002:a19:ad0a:0:b0:4ef:eb50:4d3d with SMTP id
 t10-20020a19ad0a000000b004efeb504d3dmr6288230lfc.18.1684146120265; 
 Mon, 15 May 2023 03:22:00 -0700 (PDT)
Received: from [192.168.200.206] (83.11.34.59.ipv4.supernova.orange.pl.
 [83.11.34.59]) by smtp.gmail.com with ESMTPSA id
 d28-20020ac24c9c000000b004f27e3ea8c1sm1088110lfl.144.2023.05.15.03.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 03:21:59 -0700 (PDT)
Message-ID: <8eb29c56-7a19-c599-8791-2f3a74e7352a@linaro.org>
Date: Mon, 15 May 2023 12:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/arm/sbsa-ref: add GIC node into DT
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20230515100438.359690-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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
X-TUID: TutPVziXsxc4

W dniu 15.05.2023 o 12:15, Peter Maydell pisze:> On Mon, 15 May 2023 at 
11:04, Marcin Juszkiewicz
 > <marcin.juszkiewicz@linaro.org> wrote:
 >>
 >> Let add GIC information into DeviceTree as part of SBSA-REF versioning.
 >>
 >> Trusted Firmware will read it and provide to next firmware level.
 >>
 >> Bumps platform version to 0.1 one so we can check is node is present.
 >
 > (Missing signed-off-by.)
Oops. Will add in next revision.

 > I thought the idea with the sbsa-ref dtb was that it was
 > really just a minimal provision of data to the firmware,
 > not a real DTB, and that (as on real hardware) creating
 > the DTB to pass to the next level of the guest code was
 > the job of the guest firmware.
 >
 > Why do we need to provide a full GIC DTB node ?
First version had "/magic-numbers/gicd.base" node when I was checking 
will it work as expected. Then there was discussion about making it 
proper DT node to avoid "DT has schema for it" replies.

I took code from arm/hw/virt.c for it.

