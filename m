Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2327064lfb;
        Sun, 17 May 2020 11:00:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV664kBXKFiWb4Np7ZGPPySNpAelp6i+tl4IVE5Be6UUNEgxyj84s9jBblNVouwIeQrc1r
X-Received: by 2002:a17:907:392:: with SMTP id ss18mr11811292ejb.156.1589738435206;
        Sun, 17 May 2020 11:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589738435; cv=none;
        d=google.com; s=arc-20160816;
        b=tOhcauY62bpYFJh20O3GOM4jYIK7qbYpWz/+ZzsbInL8nG/0IorHnlaZT9+dVZ2IE+
         iC0ZL7tYBn6tt3pniJbFPFVaWSvEMdcjLrcq7MHz4ACYoDfZFvsP811gCGPFBj2juLLz
         URdFhh0r1CHMM/DQMGyF7Kt1DRWXs89rmAcV5AE4CNguPFsNTEVkr8mPMfAgHJOj7QsZ
         queZ9LXvkfbSwOLdg3PX8JkZ7pa+tycRfkcgHXqwgAp7h39FWLtL2tviKGyvCfnOO+q1
         vTQ/qps1gaTGDOpi0qpIP7Tn9zF7zTQ0ui6JQbvp909oC4uUsLNPOsmTfmdccCX20A4j
         GvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=fLpKO8sZ/hqI9BOhCP2moj/9si8EyxyqgTEpAoV6SQ0=;
        b=EQedMSyLW7ywCMaB141ayXbB2576hhtcZhG3dAfjEFS/0GmdZ2btVRvUlT1W84O06B
         3mV4ZVez+Nuy+S9gt9d6F5ogG/PzEGs/b2hwlXDkCf2/8LZ7Euk16lf2A5SYIdDcNxpp
         YyerBz1KbIU9AaNFgOJF+6W67WRoC2CW+srGuclNRWTrIrvg2DlQoku6QCDpNxpsIuiE
         BuwtmKGshIAGrg7cGQIQFOLkfTStMAYGm5IfKhkKPBRVGiGh2yYq0OswpahmESJ8rnhh
         /ZjTog6qprSfh8FcfT0Mei6/M7moiQtDOdyr87zUs7ucy55Ryj1FzirPjlAoF/DWYHH4
         zJtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BmaebbH4;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id l22si4553196eds.197.2020.05.17.11.00.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 May 2020 11:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BmaebbH4;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589738434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=fLpKO8sZ/hqI9BOhCP2moj/9si8EyxyqgTEpAoV6SQ0=;
	b=BmaebbH4h1dYotZT/x5TF++cSL5ANvpG73uSJTEKHpe09JP1msZXNTEEzZt79vOCDXKhSj
	FXBX/L2dtyC/IdFF/U6q4v/Z56YcwKRbAcoXAN46I77kooF2SwWO3wsX5VgwCxiHV39csa
	1GjSrqk7eb39KCSZWbYQRh2DifvL7/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-gqQGG_ssOUKA9tW4Zb9CzQ-1; Sun, 17 May 2020 14:00:30 -0400
X-MC-Unique: gqQGG_ssOUKA9tW4Zb9CzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2358C460;
	Sun, 17 May 2020 18:00:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-98.ams2.redhat.com [10.36.112.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BFE85D9D7;
	Sun, 17 May 2020 18:00:19 +0000 (UTC)
Subject: Re: [PATCH v2 05/10] Makefile: Remove dangerous EOL trailing
 backslash
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d1eea504-4e09-55a4-53be-20f812f5b272@redhat.com>
Date: Sun, 17 May 2020 20:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-6-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: XXT+B094hA/9

On 15/05/2020 19.07, Philippe Mathieu-Daudé wrote:
> One might get caught trying to understand unexpected Makefile
> behavior. Trailing backslash can help to split very long lines,
> but are rather dangerous when nothing follow. Preserve other
> developers debugging time by removing this one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 34275f57c9..84453789f9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -420,7 +420,7 @@ MINIKCONF_ARGS = \
>  
>  MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
>  MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
> -MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
> +MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
>  
>  $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
>  	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
