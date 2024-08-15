Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp772277njf;
        Thu, 15 Aug 2024 01:25:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvE+7d1L9vJ/h6t8fKlWT0/EkJSMK0bIOPhIEBnK8VYvn6mwTMH3wxQ5aBwNx4mk8Drci3EzSUjLXB/11d9AOgmiuXU2Xr
X-Google-Smtp-Source: AGHT+IFV1SE7DxmiZmk5lBJRhzlHg0sZ2EWMyPZIEfjFRiTQJDWgxUfG80ZBJR+6KEFX6/ljqPX2
X-Received: by 2002:a05:622a:1e8e:b0:447:f361:e2e0 with SMTP id d75a77b69052e-4535bbd982bmr65820111cf.59.1723710342113;
        Thu, 15 Aug 2024 01:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723710342; cv=none;
        d=google.com; s=arc-20160816;
        b=gzvm/IfBdxb0vIh/mDK/uyx8NxIgMnzBBGSfV89Sb374cOAdeFxsQIJHZJE8z8hBC+
         yGmaT+BmifnrgLvJpXhTAGJ/iUeNZ5+RMeILjvYnyqYUT2xn8K7318aZPUDsV44buN0V
         NjhOdNbgmHshKHvyCmeah/7XP/o3G1duSjl8KeQ69u9tnrAfXnnuv642B7MS4XQmzDX6
         EJR8cCU8RuIlybz9Wa2vq18ywj0o2FCFtUqUB/CwGBvsse0cPU8yqpJfDwwSjXKd/rS4
         vxv0qzX/OpQNYJmgsDlk2u0DnkDgWh7X4jpnKZRRRVcK1ARdHsSvUJ3GHiZrZvv5J2Ec
         7WCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=e8x9yi8SHcvnBt3pDIbSrzZYuvEmVG8mRmmGsFuDMwM=;
        fh=fI4WTUBLko8e5ZS9dr2nbUq6y2JHkEpsBRYJ6keXh4g=;
        b=BKuT55aSWW7eYdj1YeSZVfnHTsHxF0RoVv0pIbgv7jHxfvilvmvDJ5oRC35i0X7DWx
         vPI2RNVdwkpId+E895wswhOCFLSd8i8o6/OgEzJ7QrTHLwyh0t+te80+/HDH05Gz4EIL
         gdnGUvIGH4axeqvwkvjs/wly1iVqr1txqjVDNDS4BPAq38cGI1VuqqXLRsiIAXmjUsF+
         W/njHAvSH8GBBeEDVkf49gXhIsOKwK+5LJpryiyKhGYvZegmxgh2BLYE+Mu0GwM0BH+8
         qLiEtEMF+xDhS1PBWRy2RWVNYbR8mDQcTfu8daDid0pbVDWA5oe9LeqODyDB3msFb/s7
         QPng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="yp5Y2/fL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45369fe6ed0si12389211cf.22.2024.08.15.01.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2024 01:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="yp5Y2/fL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1seVnK-0002Eq-9Q; Thu, 15 Aug 2024 04:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1seVnG-00027s-N5; Thu, 15 Aug 2024 04:25:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1seVnF-0004V5-3p; Thu, 15 Aug 2024 04:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID;
 bh=e8x9yi8SHcvnBt3pDIbSrzZYuvEmVG8mRmmGsFuDMwM=; b=yp5Y2/fLLyY6icOqzlOgZ2lxu7
 loCBuM5UOQh2yRxnzAs0iBR80Vw3w0NVHKPVjXA0OS2p2T4cHQl4JhTzuNEwykNPxGXmCNeUSSJyc
 3PrKsBtrr7/x4Pad0X1vu2/gdScFpavrkGr+C1TTpg+EmVB2M/1kl3rwQJsdzDm+oJDPduDLzecN7
 TqAB5x4ncHkIcK9bbojVzkHXxtuAYYijYOEg4e5Mp345dE67Ia1Gu1macRkmaVmrEv9LNR9gBNAUu
 4+cCF8IWrpf+eoBhJU8KtzfEYUs9NR5SK5wEwW+NxjGZdbJpsf/1g3FjokJD5I/Odm0mixfpLaQHT
 zDZSHec6s9vEe6FjfVb6FkPsa1D/PQ5TG8lETLVUD1Kk05G58wvKiwpiL5zJv8wYTMu6zBKAQDf6n
 Vm8TumtHgDH1IB+A5/Y6wRlQsGaO8YdSHozQlYGnR9MDhqYOEqWBmnl9Huux1jFYjJUpCHakO+2+3
 I8QEk+gw4WeeefrF27Xmg9Ipn2FYbTEXqHl2jyE9gY7sZNLcRE2pbah+b1DwOlc8pvJmC/pDtc5TZ
 Nolc2AUgYHM/mOu/+8njPXjhqUSBzJ7mOU/kdbthAL9ARX5Hhj7DWVXLVR7xuwjhSnOvzy3qIun/3
 XqxH7G8z+huDpFZnjCz66eFJidw+huAhykGdkswxI=;
Received: from [2a02:8012:c93d:0:260e:bf57:a4e9:8142]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1seVm5-0000qs-Jj; Thu, 15 Aug 2024 09:24:01 +0100
Message-ID: <11aeac5f-1985-494e-941a-5115d5e679bc@ilande.co.uk>
Date: Thu, 15 Aug 2024 09:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Joel Stanley <joel@jms.id.au>, Eduardo Habkost <eduardo@habkost.net>,
 Sergio Lopez <slp@redhat.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Jan Kiszka <jan.kiszka@web.de>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Jia Liu <proljc@gmail.com>, Helge Deller <deller@gmx.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Subbaraya Sundeep
 <sundeep.lkml@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>
References: <20240814181534.218964-1-shentey@gmail.com>
 <20240814181534.218964-3-shentey@gmail.com>
 <22fa9014-2923-b501-e38d-f5dd1e53d15a@eik.bme.hu>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <22fa9014-2923-b501-e38d-f5dd1e53d15a@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a02:8012:c93d:0:260e:bf57:a4e9:8142
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/5] hw/char/serial: Remove unused funtion
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0C3WILc5rz2S

On 14/08/2024 22:38, BALATON Zoltan wrote:

> On Wed, 14 Aug 2024, Bernhard Beschow wrote:
>> The serial port's frequency is set via the "baudbase" property nowadays.
> 
> Please keep it as some devices might have registers that set this freq and this 
> function will be needed for emulating that even if it's not emulated currently.

Why not remove the function if it isn't being used? In general having unused code 
lying around is bad as it tends to bitrot.

If someone did want to re-add this functionality then you would likely want to do it 
with clock API rather than using a separate function.


ATB,

Mark.

