Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2184892ejb;
        Mon, 31 Jul 2023 06:45:53 -0700 (PDT)
X-Received: by 2002:a05:6000:45:b0:317:5a99:a696 with SMTP id k5-20020a056000004500b003175a99a696mr7691895wrx.68.1690811153363;
        Mon, 31 Jul 2023 06:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690811153; cv=none;
        d=google.com; s=arc-20160816;
        b=nwF84/dqT44SbOS2fKIJeaWEQKBtY/14tibNzEryEmYRNO/UWckKk5XE2B+W6MxPDT
         6N2ELAyqYIR5lOufDg4mIAyJeVgiA94JKN/2pIHKl5pReTQ42D5zjPmVwyUa32rdt7QX
         yAiiKNEG8FBJxWK6fF8MDPtV4C9oMK4LRWOpNfWMqh+ZvaRnadGOBTyN0Sr6XOMR1cPG
         HSJd1+kdAPDDGVrjXTMTxCYhg/sUWo+3in3hnCTihUzTpLTa47ArakaTe82W0iBTMsVh
         iiGptZY4moDHp/8LuWcNE3vq2i2inPQUIVVwBDer5OafXIFMQRIErMvRuXHh2jEsO3S1
         hFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nQ3reraINQ9aqfKUKaeldl1vlh1lyTB9JIH6X3eokKs=;
        fh=99M8M+8TD8TDQI1qe/4NtoIvOpLCBIu4dx5efhOEhl4=;
        b=1DEuMYxa59b2mpBoENfQjWF8n7R0VYRCIHZs+q2+IB6IrHkiU5gU06bZo75CxCnEIw
         c/uXI3IPLUVixichZpITezwaL2FFd7JGTvlI7H1TjfKXu2cMqnriV1vbcmH36VPyAEzE
         5s5oJp2ebVFm99WBHqjN6cqa1a8uBrxIR9qmNH7d545/g88uPboAspe8jr1/WhytKcQp
         yIvO/Jb3SutpM2ZFIdOhVIU1xS68v7DWpRYCHsEZlsCBqNU9xfig2zzXwtd8pK7fYOji
         aHzBb3fCY9C30embFlpPsYJnjn2us77jDPZAnV1PuMUeEYSCUbhz0PGZQpxfD5Ckitvz
         8uWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h9lwSGnc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v12-20020adfa1cc000000b00315a43d2715sor3496343wrv.9.2023.07.31.06.45.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h9lwSGnc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690811153; x=1691415953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQ3reraINQ9aqfKUKaeldl1vlh1lyTB9JIH6X3eokKs=;
        b=h9lwSGncjCHcAn12JKsftrabS4nfigm3sHN+MhY6qrIozYkfycqMaJwYAVGMULRLRl
         hCIAFrlDlr5qOK4DzdtoxX0IeATQbS+bc7oRO3QQlbIQ3t+A010rT78zpKnbN1GqMa31
         MTHUga9IVCtMFnLJBPb0UBswnRupNB6r8jzRRur33UAiwjLgczomFkN2LArkuSW2zie1
         +VWN47jxXanCA0sq3gFMCibAmT8KqIJ6jxQT3dSmBE3a3FFc8zVhUORcIykbbs5tz9YQ
         1VIlmgsjKh19oF8n7CP97ygzELRD5uY8v+I88WDDD9/1qnUdOM1f0lg1YWGbz62BF7fE
         XwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811153; x=1691415953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ3reraINQ9aqfKUKaeldl1vlh1lyTB9JIH6X3eokKs=;
        b=JCArcEz4aqDIamv9uSmlvjNAnB2KeRUwUdnWJ+JQljcAX3+mEUAYM7ZntHgEyQti8r
         nllR54o3/sfwI5Avf4XttyImwaHI8Jj/vOOz4A51zYvh/bA7e+LnKUFEfE29wGjN2Dun
         Lx1ZqH5bR9t54gqzbewWG8iRntJkvgx4j85ils3Z2mx0PH7fdg4uxWrfdj8Y7/fjfG2v
         WxZh22934HUBRu1l6nIXQIy/5oavGGyAXP0t+mbKZ04VuPE/TlyG4pzhjkvXARjJTDWu
         9BzuoodxQQOQ8iNMPtB0rBPiSDOR3LabnHv3RDs0IDUGE8cQnlNG2YaQn9XsC2fauu6B
         tq0Q==
X-Gm-Message-State: ABy/qLauIsz9UBOh7Qnm7/Nzc5qe0mAgv1sxchQIB7Kekt1Jxhhz1bcg
	Dswv42NWGAhzfp00mVNRq6UYLFDx
X-Google-Smtp-Source: APBJJlH4gyq7JrTkfEpvQa84k4NIFE18KTu4UsifBNdTs57wOfERvKO5Hcmx4G0JBwtVPCjxuezb3A==
X-Received: by 2002:a5d:4acf:0:b0:316:e04a:29e8 with SMTP id y15-20020a5d4acf000000b00316e04a29e8mr7512961wrs.54.1690811152959;
        Mon, 31 Jul 2023 06:45:52 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.198.42])
        by smtp.gmail.com with ESMTPSA id y18-20020adff152000000b0031784ac0babsm12011439wro.28.2023.07.31.06.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:45:52 -0700 (PDT)
Message-ID: <6b4c6870-35a3-0f7f-b405-ca6e6634c4ab@linaro.org>
Date: Mon, 31 Jul 2023 15:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 08/24] target/ppc: Use GDBFeature for dynamic XML
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
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
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-9-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-9-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LZt4k5lxCIB1

On 31/7/23 10:43, Akihiko Odaki wrote:
> In preparation for a change to use GDBFeature as a parameter of
> gdb_register_coprocessor(), convert the internal representation of
> dynamic feature from plain XML to GDBFeature.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/ppc/cpu-qom.h  |  3 +--
>   target/ppc/cpu.h      |  2 +-
>   target/ppc/cpu_init.c |  2 +-
>   target/ppc/gdbstub.c  | 13 +++++++------
>   4 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
