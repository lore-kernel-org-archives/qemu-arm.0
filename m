Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2179244ejb;
        Mon, 31 Jul 2023 06:36:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3484:b0:3fb:b18a:f32d with SMTP id a4-20020a05600c348400b003fbb18af32dmr10705023wmq.17.1690810568050;
        Mon, 31 Jul 2023 06:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690810568; cv=none;
        d=google.com; s=arc-20160816;
        b=UuCZpQs6yCSdJJBLyaqRW7xTRTA3GbqP4VylIE1wM3vJyTK028NIxSahgsxVRL30ih
         iGvEvCmUMmMWUDWDNeKsX5jw4opG5ObJdoU76ou8wu24ayOjCUjYIRBk3UgfOPsjuPRc
         sGiaAdBcI95dTu+uHjeYwjZxXd6maDj8AH+rv3bGdmu14A9SmKBb9QsKXSgugk+rbeTz
         6te6iD94SzJggbCbx5kHn2Fe27e78h7OF9b3Y3llaXgz+k6d7l4dpR2ddIK03ysKWJgN
         7eTyYphuTI2zY6KbQtd+ospn9gAM5At9VKl1Pezlh4N7hPL38iT5NUJNDGoYrRpQTCkM
         nLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=S0z9m68fumFWDSuz2IWQxIZ0SeaHB4wPDPgx2tio7qw=;
        fh=99M8M+8TD8TDQI1qe/4NtoIvOpLCBIu4dx5efhOEhl4=;
        b=cn+GEaI+aCH55Z7rw7LyaaUMj4EoJw/rmD1eFBuAhN2MOVa3UyNOLEpgcDdD+uXP40
         SpEyYg2wNqLrJ8KO6qEgujiiXo5Os5QvtPCwRe8dPvrhcXLK8sCspeOXTqPICM17rLbX
         fNFnskZoL1jxwy7RRFRA5JgtP9SMmXDjKcvRYG7OdPs4I3Kk6/+9MGtijNADpz4S5dgL
         6rMk+1Agyed9a15yiNckN7HnEe1Tki+lUOIkb0Xux3NBtvtOzyoUkiv0Ihm3NYEdXW7F
         0pgHCQtAX3ZyeqOzivtQYY9FFdL4VT0C/92yXxxelpd2tX6o8YWHgjmPa4bXxO9BapKW
         kX+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OxX6931Q;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p15-20020a7bcc8f000000b003fe16dc954asor1228173wma.4.2023.07.31.06.36.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OxX6931Q;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690810567; x=1691415367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0z9m68fumFWDSuz2IWQxIZ0SeaHB4wPDPgx2tio7qw=;
        b=OxX6931QTMcRV2b/y8dp4xkgJMbhPi/O4rOe3kq8HpIoUo4hg2NUi5vC+qcL8w77yQ
         BA7fIeaI39JPzCxMCcoXzi1P0niV51Y08U7Ot+BerqEjfXyFbpAUjL/SgbO54YvZMiw8
         SYZKwq3NArV3ildsW+rN3Bg1poWp2CRC0n4nm65zblZHA0fupvjky/5CVsN4BP5wbjUN
         ZE7P42a535XXrT+LPbQEunlnfGMcD59y6EtS4wjZ4iKQWVTpYoDzupukYKN3r0WYA0YV
         +w8TYcBpiYnpHACMaOe47+ydTvTDOjgLYiimisll9oFuAvRC7eRLJqhfS7AgXVMU+658
         s+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690810567; x=1691415367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0z9m68fumFWDSuz2IWQxIZ0SeaHB4wPDPgx2tio7qw=;
        b=C47hnKodylS2qhkH7F37tddEVe9Ia20UcEe7Q8U3tn4Gd6luN8+bQwDlSt6IrlzVUr
         w0SQsof1LLyVMvL++nqisjazyFvR+d/6nslciOwSBDX/p1qGARRDX4bmhkflEYZgKXa7
         l5tMf+kOIwZ684K3yaVINv3kXuxJD2zE8h+lffTMf5wHj/1lBCXv5dau7HkDJuKGFsLv
         jrmLrhDDlTTAkXjJaa81GWkT4HHp3OXy1jU2qOcC4i//C118f/saGJ8WASDFL/AeKtLO
         ZZCE0O8laimobUfLbZDax7zL9bygGAbVSG/VJP/ogaGCqX9RIJdt+ExLOQt/o6raSX8e
         JcEw==
X-Gm-Message-State: ABy/qLasMM4UNEdXpCuWZd/98l3j8EMQp/PntIFZW0J/5YD5abTGl2NN
	El84GH+1DQv8rpSLYY1ukkwLv3AYrt5+UeraPG9HwA==
X-Google-Smtp-Source: APBJJlHphjBoN5iWkPwJPtmrbwnGtoqD5CFqMasC8/idVq/LLgnv1DQcqZHVBhdhnI7YCujdIYZzlQ==
X-Received: by 2002:a05:600c:29a:b0:3fe:1c10:8d04 with SMTP id 26-20020a05600c029a00b003fe1c108d04mr3749092wmk.19.1690810567628;
        Mon, 31 Jul 2023 06:36:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.198.42])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003fe1ddd6ac0sm4122960wmc.35.2023.07.31.06.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:36:06 -0700 (PDT)
Message-ID: <b41b076e-e423-7399-c03d-1f002edd6324@linaro.org>
Date: Mon, 31 Jul 2023 15:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 03/24] gdbstub: Add num_regs member to GDBFeature
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
 <20230731084354.115015-4-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-4-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 59zLftX4LW72

On 31/7/23 10:43, Akihiko Odaki wrote:
> Currently the number of registers exposed to GDB is written as magic
> numbers in code. Derive the number of registers GDB actually see from
> XML files to replace the magic numbers in code later.

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/exec/gdbstub.h  |  1 +
>   scripts/feature_to_c.py | 46 +++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 45 insertions(+), 2 deletions(-)
