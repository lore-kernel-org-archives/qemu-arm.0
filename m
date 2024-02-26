Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1908507ejf;
        Mon, 26 Feb 2024 00:00:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQ50YHbbDPRXhpwdr4O0a1rNyE1iIPj8ZKh4JS7xA+IkH3AhXHQqutCdOFb3II0UGAfU1tJzCNwWArj1JNmKlrCb1sZYcr
X-Google-Smtp-Source: AGHT+IHlYnIUSCSTF5ZkEe4u2YMczrAmgkdtfHgUGDKdFg+ZrK6YPsCXcRfw+ZAoo3IPYUSQ+EPp
X-Received: by 2002:a05:620a:5697:b0:787:51ea:bee3 with SMTP id wg23-20020a05620a569700b0078751eabee3mr6757784qkn.50.1708934434411;
        Mon, 26 Feb 2024 00:00:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708934434; cv=none;
        d=google.com; s=arc-20160816;
        b=AFqiAd+uLfjUN69FcO/ddfIW8oQn0Yi3HPH56Z5RW7OXY2Yc3mRyq+qDf61sCpHSBv
         ICCFxcZeZ1gznT+LU6Ndsi0gg4g2nIdnF25d8TlT8kEDTN3OynKSjvKoiU+/6YoZYxgw
         f7mYDqi/n1lDj3J0cyFTU4EXsIALEiwgwgP7znQsMrFX3HsUDTabH059ZePBSl6N0re9
         cldZmtZyDWaFH2bWj2G3aOXz/ZoFVXFgePw5tIyhqDEpDoL5FfdOXCr6IXEp07HkhTAE
         oj6bp48Rpb9W5oLoq7c0j/Ol0gvcn8kccl+hpqxhwiWzJDJsG0HQRTxGjVmS/6Hs8+B8
         vs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tocygTPe2CdZOmeFdwrBgDUzjE4zNS6gAo1CazRChe8=;
        fh=+4RsN6x9AqCMoK6Jum5LLWES7Z/EYfaoFFRI22/8v6U=;
        b=fTevWr+gGw8DIOziQRVppbm7gQcBoDZ8jenvDlDKG/QCsfXcVLpc6EffnEI4Ug4M4R
         kqj4jQQPk1TJEZie4pNX0wP2VmX7SVVO9+/3ALL4Ldv17e+Z+1rUZ4chCQ5bXHc2e5cg
         kZUIGOgixXSXdyNmGAma4FvydMKamJYiYKyDui4L6RFiTwlcDU1efwHXW384e6r5opQQ
         FJWVY3LsPEbPZe3UKuy5LWW/t27PSDAksnPy/pNvSK2joMMVL6cRylu+H4dMHftFiZg8
         Km3ytk2sBjdg/FFaNWECH36SuJxDtpHstbB2pDjZYoUt0o9xFFyRmFWwa6p8YYXAgq3x
         JRBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XxoEnQRy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020ae9e70f000000b00787aae623a1si4656744qka.536.2024.02.26.00.00.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 00:00:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XxoEnQRy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reVuJ-00022C-Fs; Mon, 26 Feb 2024 03:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reVuG-00020z-P0
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 03:00:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reVuB-0000MS-Fi
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 03:00:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d26da3e15so1402790f8f.1
 for <qemu-devel@nongnu.org>; Mon, 26 Feb 2024 00:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708934406; x=1709539206; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tocygTPe2CdZOmeFdwrBgDUzjE4zNS6gAo1CazRChe8=;
 b=XxoEnQRytQMNeW+5KRBNJZp3GxviUHrMaI1zmW/F+HPevazC/p4hukikvZcPP82dYf
 joE6Sm1dC1CuoOjffYC91JAEoIUkTNWirtKAtsa41ybAGTFe1khXyCo+abyyGeRudHHw
 6d77ypkIxQ87+mdXgX7BOEV0R6FPPVsLBhhNiyQpIF7jrxSQcBXrWmkkhajFu97umFLn
 4nI0TTaq2VL9HjrQcS2Kay1Ra7zIsYCtXbLlf0xGoLFs12wZgI0vr0hswX+oS0PxINMC
 LqLyiIu9Y+9wEzJxwy+oKwEJU3FtyVQFJTSkE0rbOBvr7XtJJf0s/fElRLPCMOt3MWk0
 a6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708934406; x=1709539206;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tocygTPe2CdZOmeFdwrBgDUzjE4zNS6gAo1CazRChe8=;
 b=LzlOCk6hLRPaMc2OUC3JZKahDkS4PmPNH5U4c7NsZvoJLN+xRm4PKYpn6AqAb9qiAn
 qbfoIThlZH+lRt440nZTfh+EaNPUASV00Ci0xMTwWC53aM7dfIBK4JLnETBkoSoyovTd
 cCrpfiS6K7Z7t99x5SfLLRcdIRqWwRyyfiXZDpJpqyunFQLJVtPvYgMPDjLOVtSf7TmB
 u0Uz55+OloQUdO6LMPenmWWRBcd6PLzPTKJ8fllFwbmvL1ihfrs1viyjBCav8A6fou+R
 /3ns43UdFvbdcdZIqZQC3K2PFoOXrFL7OBllxe0Yw97JMmci7Tw0itlHU4UyhED7e/3D
 JroQ==
X-Gm-Message-State: AOJu0YytUDwqu9jUzLydIHS21iO4DiCJJ98YYrDm/+cyxwi8x+1m/uU5
 A2du8y1nU0LfTTXhqbkKpKZ4rlaa5+IQtZBhSEwkAYnmNGnDxqgdOWK8eOZAjxU=
X-Received: by 2002:adf:ce10:0:b0:33d:7682:49a8 with SMTP id
 p16-20020adfce10000000b0033d768249a8mr290647wrn.16.1708934405686; 
 Mon, 26 Feb 2024 00:00:05 -0800 (PST)
Received: from [192.168.69.100] ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056000188700b0033d926bf7b5sm7521110wri.76.2024.02.26.00.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:00:05 -0800 (PST)
Message-ID: <fd0fba89-cd93-4113-9f3d-2ee20f2217d9@linaro.org>
Date: Mon, 26 Feb 2024 09:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw/ide: Include 'ide_internal.h' from current path
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20240225171637.4709-1-philmd@linaro.org>
 <20240225171637.4709-4-philmd@linaro.org>
 <feffd329-59e0-0291-0dd6-76a625da190b@eik.bme.hu>
 <878r37lll6.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <878r37lll6.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8YKlv3zgedoT

On 26/2/24 08:40, Markus Armbruster wrote:
> BALATON Zoltan <balaton@eik.bme.hu> writes:
> 
>> On Sun, 25 Feb 2024, Philippe Mathieu-Daudé wrote:
>>> Rename "internal.h" as "ide_internal.h", and include
>>
>> Is there a convention about using underscore or dash in file names? The headers Thomas added are using - as well as ahci-allwinner.c, only ahci_internal.h has _ (but there are others elsewhere such as pci_device.h). Maybe we should be consistent at least within IDE and this series is now a good opportunity for renaming these headers to match. But it's just a small nit, thanks for picking this up.
> 
> This is one of the many unnecessary inconsistencies we're inflicting on
> ourselves.
> 
> We have more than 3600 file names containing '-', and more almost 2700
> containing '_'.  Bizarrely, 68 of them contain both.
> 
> I strongly prefer '_' myself.
> 
> Zoltan is making a local consistency argument for '-'.
> 
> Let's use '-' here.

Fine, patch updated.

