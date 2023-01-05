Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp358897ejb;
        Thu, 5 Jan 2023 06:46:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuaLbLnGzoLutgUM4udqlOBDP2oBoZPpF6yyzkWwsDB2jFwZ/vRVuoNqclWVtDWhN70Lgxu
X-Received: by 2002:adf:a497:0:b0:2b2:35:e0a4 with SMTP id g23-20020adfa497000000b002b20035e0a4mr1799303wrb.15.1672930003469;
        Thu, 05 Jan 2023 06:46:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672930003; cv=none;
        d=google.com; s=arc-20160816;
        b=0860uxC5RRAhoFdne3Ehz3YiuUXEfe3Z1fAu0b/IA7yWFB2Lfeq7FBjLsJ9YNPv0g5
         AkU0gC6mIjGQfYRByX5Ue/mJau/8/z17gLQ5sCxqAmZ4NbGvg7TXUuADEgD/Yyk7Sb3u
         DdGLaHlpmmYi9y3NXLfDzXUM/0N35feXtItzkqg/1t37cV6yvbjCLAh3JfWAz5dGE4TA
         /Kp8BWbFHtgGE7wXewglxQedz9QaqbMu1w+0hkPmyLhc292uVozRe1iSKA/qRMv2bFNJ
         5zjvmP6oC4TWpF0bAUO8wQCygpGvpysvu2lpijdX43sQBUxMTPIU+yCzA32Oyn6VQkI0
         B4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from;
        bh=uHaag+qhfS5NUCpRORGiD9GGCfkd6sEub44OebbNXG8=;
        b=dtoffsWI6zi9PcZLx+hKsUTiZBos5/V14bHlK0pVYReh0IIb7+fyf2+r3ZhGepRVCD
         c7s+qSvQwHhxc1/GU3Y1KpEpxJebMI3rA0tTS+f3cHaWJH51D4b0o4Cl9Jva3kL9zME4
         aZdNRy1KHc0wXgn0ijyj+ODo1QCPJpid/Jv9sx4Z55np4DI0NcncSo5MYkG5GF4MYekw
         K2hmvtgaVGlI6aZMWhc7kxbjZBBAEEqw1nrKe5CoeMKg55U3XVIS1GlWOOI/wdCtsetL
         +vE24WK6tgjW5V7dPgfvjzCjLwTNdMSKDKIHMOFDCI8FEKP8Bs/M0XiMjvgP8b1y0ewI
         7qbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id d11-20020adfe2cb000000b00236dc2b6001si22248004wrj.167.2023.01.05.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 06:46:43 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AFAB575B03;
	Thu,  5 Jan 2023 14:46:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3733B138DF;
	Thu,  5 Jan 2023 14:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id C/FpO83itmOuFQAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 05 Jan 2023 14:46:37 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v2 0/5] target/arm: Some CONFIG_TCG code movement
In-Reply-To: <20221220220426.8827-1-farosas@suse.de>
References: <20221220220426.8827-1-farosas@suse.de>
Date: Thu, 05 Jan 2023 11:46:35 -0300
Message-ID: <87pmbtdook.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.10
X-Spamd-Result: default: False [-0.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO
X-TUID: qem0L3+XDukt

Fabiano Rosas <farosas@suse.de> writes:

> since v1:
> - patch 1: dropped. I will include it in the next series;
>
> - patch 3: tcg_handle_semihosting does not need tcg_enabled, only
>   CONFIG_TCG;
>
> - patch 4 (new): moved alignment check and updated comment.
>
> v1:
> https://lore.kernel.org/r/20221216212944.28229-1-farosas@suse.de
>
> Hi,
>
> This is the second round of rebasing the patches from:
> https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de
>
> These are the simpler ones that move code under
> CONFIG_TCG/tcg_enabled. No new directories or files.
>
> Claudio Fontana (4):
>   target/arm: rename handle_semihosting to tcg_handle_semihosting
>   target/arm: wrap psci call with tcg_enabled
>   target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>   target/arm: only perform TCG cpu and machine inits if TCG enabled

Peter,

let's drop this series please. I need to double check patch 5.

I'll resend it later on all along with the v2 of my latest RFC:

  [RFC PATCH 00/27] target/arm: Allow CONFIG_TCG=n builds
  https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de
