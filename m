Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp800350ejc;
        Fri, 3 Mar 2023 00:33:25 -0800 (PST)
X-Received: by 2002:a05:6870:a44a:b0:176:1fe8:8922 with SMTP id n10-20020a056870a44a00b001761fe88922mr536226oal.29.1677832405792;
        Fri, 03 Mar 2023 00:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677832405; cv=none;
        d=google.com; s=arc-20160816;
        b=hd3vIGkmvMmF+xzKnPZ8gh6OGl4VvgfsSYjASgG/KLOlGOEkQRRctULBiVHphRZJM/
         IVl7pxuILOz/ogcG06cjWLznEDSnx2cmjoDGZ0IJ5OD8GCLUQF1HnqK9E9y/d7WIdPdC
         lt0XSopVV7NffbE8LAfAFqBKSMpxEdc3OzwYoiOKIEY6eVOUqEiuylfzzkNZ+7nA3MJw
         DMSC/i4WuaUGJSke0S6OqMAV+bsiJkJQv/SkekfhFH2s6Q8EQXxHeAQbeW3mNY5wgSTz
         8sBUNhdG2vt+P8FkWdYd7tcUvAk1SAG2x6YNqBCrH81kdXbdrannzZXLqKrpqwNthcYc
         RQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5poiB9hHsOof3PcUw2itX1s4KSe9/ZAMgLRbkPBocmw=;
        b=Ok+qSlK3Bk5kDkF3A9WkXXPj2sJaQYKYjSnTdox4tYveTS0MHI7gJKotyalv1xsKLE
         PRa/LGpGLTh6oYaGX7txvObBxhqY+e0RCBjrInLd/Eu/mblGbhOr9hnT80rpNzdtF18u
         FTbuKVY+5hML0FxvN46+2ORGfiRN84/8pQWOAPXx59nFVUbQ2ZvxuH4QeV4ItUtzTHvm
         Bosl3e7cx4bFdJaMpgThfwxhwQM56UE56Kf7AmhJF+tHA3qHyoBl6ExNw5+gPr1612FI
         rZRCyt8n9vSBsZQluJSe7yrkn+AMCkUkZBQVIsw51HhRsLiyYXk8BLL6X+AutFufKAsO
         a4Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=FbWXFoPP;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com
Return-Path: <dbarboza@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f4-20020a056870d30400b00172be654bb3sor578152oag.81.2023.03.03.00.33.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Mar 2023 00:33:25 -0800 (PST)
Received-SPF: pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=FbWXFoPP;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677832405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5poiB9hHsOof3PcUw2itX1s4KSe9/ZAMgLRbkPBocmw=;
        b=FbWXFoPPCV2woaEFtMpP8EV9lfsqYjE40+w4F0JcHNkyd0MJuJ6EUuEOgBEQA1PceL
         MJdWRXjEsRaDpgpi8u9GxIdWJjGO3+tjQJAGR9xo0wE4n/72MD6s8caj291SKJtPb2VD
         Lt+sdzK58zf4LXGUtQtjQrPFMYZYp7SowvzVmVN+rfJu4LyVf6KnLIZhBZVlqXK49MOC
         IFiz6dQqt50J6W+y05GXsb0PxlVf44UrtH/QH+i0HscaFdFTddTOhMBebe0gDOMLAMCx
         5xZS/KbOJI9rVUtQLXEMt/r7VNLkj5FAx91/mlFkQbmxIEmoYbBgQcHwnEPl/zybcjVT
         dJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677832405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5poiB9hHsOof3PcUw2itX1s4KSe9/ZAMgLRbkPBocmw=;
        b=msuRwgvzok1GlyKqGvbPE+/ldmOCXTQI6gOLYkTpQUAsFf+EbUFxcqxCoCd2LJ3HHR
         vgMorWSxWlCYViCZRqhnLoAKbwhonzetepoXSJtTmipys1m6PHnMgtuLFJlom3PG38gF
         7KL8kj5wE0QJliBKepSBJc+TtKRmYbKHNpt6iuk/72XpodGtdOJTtWJCxKDDn1he/i0/
         kaC4alIZZMqVnaAHDUeruFyVhLntgmFxe22KqvTfYhd0iZOtRVZQzNp2hD8hip6G7t2A
         dQHYz3ogkZGNKLXBGrqtJVAnpKpxEszjqRBtbbjG6ErZC1ObF+Skjh0Wm4jbkbiEcxCc
         M4AQ==
X-Gm-Message-State: AO0yUKVtbxyQ0v2R+YHji799PU8R46wjA6yDkTgYWXMWiBBlmRZRAcyg
	4TpGqCs4lrL65hHoXHZ6C1inDWvanmyMiIjI
X-Google-Smtp-Source: AK7set8hlr1yHx+OBqCBQiyW/tJc0LeKAGcAzKgQug0uqmMG1EmbLpBoo1gFuxZYTLA7H9cb7XHBMA==
X-Received: by 2002:a05:6871:207:b0:172:7c37:69b with SMTP id t7-20020a056871020700b001727c37069bmr712055oad.5.1677832404958;
        Fri, 03 Mar 2023 00:33:24 -0800 (PST)
Return-Path: <dbarboza@ventanamicro.com>
Received: from [192.168.68.107] ([177.189.53.31])
        by smtp.gmail.com with ESMTPSA id eg27-20020a056870989b00b001727d67f2dbsm746714oab.40.2023.03.03.00.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:33:24 -0800 (PST)
Message-ID: <a6b263e9-cc54-e657-8dbb-0c08f5864fe9@ventanamicro.com>
Date: Fri, 3 Mar 2023 05:33:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 04/26] gdbstub: clean-up indent on gdb_exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, nicolas.eder@lauterbach.com,
 Ilya Leoshkevich <iii@linux.ibm.com>, kvm@vger.kernel.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Max Filippov
 <jcmvbkbc@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 qemu-s390x@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Marek Vasut <marex@denx.de>,
 Greg Kurz <groug@kaod.org>, Song Gao <gaosong@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>, Chris Wulff
 <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, mads@ynddal.dk,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
 <20230302190846.2593720-5-alex.bennee@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230302190846.2593720-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: M03DQcjlZbku



On 3/2/23 16:08, Alex Bennée wrote:
> Otherwise checkpatch will throw a hissy fit on the later patches that
> split this function up.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   gdbstub/gdbstub.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index fb9c49e0fd..63b56f0027 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -3021,27 +3021,27 @@ static void gdb_read_byte(uint8_t ch)
>   /* Tell the remote gdb that the process has exited.  */
>   void gdb_exit(int code)
>   {
> -  char buf[4];
> +    char buf[4];
>   
> -  if (!gdbserver_state.init) {
> -      return;
> -  }
> +    if (!gdbserver_state.init) {
> +        return;
> +    }
>   #ifdef CONFIG_USER_ONLY
> -  if (gdbserver_state.socket_path) {
> -      unlink(gdbserver_state.socket_path);
> -  }
> -  if (gdbserver_state.fd < 0) {
> -      return;
> -  }
> +    if (gdbserver_state.socket_path) {
> +        unlink(gdbserver_state.socket_path);
> +    }
> +    if (gdbserver_state.fd < 0) {
> +        return;
> +    }
>   #endif
>   
> -  trace_gdbstub_op_exiting((uint8_t)code);
> +    trace_gdbstub_op_exiting((uint8_t)code);
>   
> -  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
> -  put_packet(buf);
> +    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
> +    put_packet(buf);
>   
>   #ifndef CONFIG_USER_ONLY
> -  qemu_chr_fe_deinit(&gdbserver_state.chr, true);
> +    qemu_chr_fe_deinit(&gdbserver_state.chr, true);
>   #endif
>   }
>   
