Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp666932ejc;
        Thu, 24 Aug 2023 05:40:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1a89:b0:269:3cdb:4edf with SMTP id ng9-20020a17090b1a8900b002693cdb4edfmr12211095pjb.16.1692880815876;
        Thu, 24 Aug 2023 05:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692880815; cv=none;
        d=google.com; s=arc-20160816;
        b=bhzKYmjFuPg4zOoaOEjFcU6BNFuwoMLJHsAY6KLhzpu1Ii3Z8Gm/fQAEK8W6YRODbC
         NDprj2bMS9vXkB0OiTF7JzEv7Re5pLlSIJsLptZ+ormohPVcOxayZ9Er0WZkmCPCPuyu
         18GfWafH9oKphGnhQRt1TeIUcN11aiNg2liISI/MU6gu28QZSEnjEiziIWd1Bn2E69XL
         1f03E00FCya90Rcwql0JZZRleedv3mEX3K+evec6WsSpD4UAV3lvGEj0iLfzvVjaLC50
         nyphIEbQqZyc+H6ta1byCUy3pvS3eMiLhFuMPD4GTOxX4MVme585Zvw5DiaMqNl208Ad
         jhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AlD0KkcoSMnm2QId2bF2QJsTp5aZ7edM05dvtgmHarY=;
        fh=/XrdGGFRcAC8WgZnR1YP/3z7WpmfsWjeWw+jcsPymo8=;
        b=rgWgMzZXjeL4QQXRJSGlCTr+1CMYwh5chNtVCljGnaagfq9gmA8kwPIvEqQqwgDZ7g
         SKryeIMD0msDd8u50fnsLigpTxtDcTsh3Q/sU17XMJicppzRP0ItMZx04V1tsujr2tsw
         XTrauD/m4J69gxs6miGCZ3i+3sKzS9wWm64MqGuCMO3jQmMg3i+hy/k2Rw1YK01vk5ZI
         3XfDDFDf7QPmEGFb8T6I0qO2WqUqZ3XeEDCKfejA4zwsDWA1YhwIdg+63yfI72uWNvdh
         FZkysRq3P1Wr77FKGcVIKgjEBuQpaOeybXu6Ebx7sf3OnyVtAsfq0XzLP2XldR7JB//P
         AeEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=2GE06rsc;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c15-20020a17090abf0f00b0026b49c1aa4fsor6479484pjs.3.2023.08.24.05.40.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 24 Aug 2023 05:40:15 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=2GE06rsc;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692880815; x=1693485615;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AlD0KkcoSMnm2QId2bF2QJsTp5aZ7edM05dvtgmHarY=;
        b=2GE06rscmgwtSEOK3aKHSpS4LRMu8rmUk/KZrP+bdvhnsQ5jwv+yCCBw+vTaIpyvJs
         eSAhPdT0etRUNmbGIwTrVaud5pnke26oC2rKhgP5XMuShYlROu6i5CWeJu9cKRMsh+HF
         LVDLTW5gvwTrqAhH3jSWbxgUefmepNpbAWqA5VL71QSPdG1brHBYiwg40/cAzEm6Bc+g
         /LU4VTojJSTe9lHX6MSuB7bMG9DTOZA/p7G1WiIdCL3k7SH9O3dokqlQ/F8bL8Gr3tIi
         5jQI2PRDCpp2AyPaa9j3yh8mkwolEneLgQmXses061xbGAhHYpw6v/bfBLiTK5ChEbdk
         orNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692880815; x=1693485615;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AlD0KkcoSMnm2QId2bF2QJsTp5aZ7edM05dvtgmHarY=;
        b=bFMY+LtL392Xv0gI6W2t1n02mafDb5qoG2rydCtQviRuq4wmSCRwnMC+/iWp7DmVnH
         Ou+WrTHGmrk4oLVuez+Ew+hdMgu9/x0tJLgPYGArGNKUbfyNeQeTY1vuJ+dLjCLNlV5P
         hUMJ/C71NQe3RPTwjihIQzVcwjOTvM3Yb/wYQJWdsMBlNh8KgqIJROOgpst0wN+66F5c
         4KP6T158L0erdeCZQLKm8C6I5etPE64anjuwZP2EOeyfbqCoM/JHt1j+ySyivuRmS6JX
         nRppHFaGr10SX4tVpsq5X1akzqpg2R2wLv9tuwFlfRwWmMQBpVBCMvgj2LrZYVhHEetw
         1kEQ==
X-Gm-Message-State: AOJu0YwRW+z9zgm/r5Jos+1vSs/v4WCtU/IGJGwRyJpsN81DtodBNEbq
	5h0Ge75r37o1pytANiGkg4bALcH8mvM8XLXRy+Q=
X-Google-Smtp-Source: AGHT+IFjJ+DGBC6A5fjKq/d6Bq4vcJn2uJykLIl0SwHmvdO0JIAHD+Ws+6BTM2E5J1IvXoy2/jTbWQ==
X-Received: by 2002:a17:90a:dc05:b0:268:a691:412f with SMTP id i5-20020a17090adc0500b00268a691412fmr11837891pjv.39.1692880815202;
        Thu, 24 Aug 2023 05:40:15 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090a16d700b002680ef05c40sm1609373pje.55.2023.08.24.05.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 05:40:14 -0700 (PDT)
Message-ID: <0a1b665c-31dd-4263-9f67-a75c8aa3fd7d@daynix.com>
Date: Thu, 24 Aug 2023 21:40:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/26] plugins: Allow to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>
References: <20230817053017.24207-1-akihiko.odaki@daynix.com>
 <87wmxkfwfo.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87wmxkfwfo.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jTsNPELBK7Ja

On 2023/08/24 21:36, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> I and other people in the University of Tokyo, where I research processor
>> design, found TCG plugins are very useful for processor design
>> exploration.
> 
> This series didn't seem to complete getting to the mailing list. Can you
> re-post or send the next iteration?
> 

I have resent this series and you can find it at:
https://lore.kernel.org/qemu-devel/20230818033648.8326-1-akihiko.odaki@daynix.com/
