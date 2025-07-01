Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3350094dye;
        Tue, 1 Jul 2025 11:30:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViXoJtXSsU93/WoJFuaDaOGbSOUCpcsJyI2BjNrgs41ekqRjgtmD07YcQEHiNZ5fpELk/k3Cux3diC8A==@linaro.org
X-Google-Smtp-Source: AGHT+IGo3eecOun0vZVkemzIFUpl4A2PJVN6Q6l+IYi8nfbx37SPpw+M8TPqTPPh+VTXFyxYLZxH
X-Received: by 2002:a05:620a:31a6:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d466d0cc76mr649155885a.4.1751394623828;
        Tue, 01 Jul 2025 11:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751394623; cv=none;
        d=google.com; s=arc-20240605;
        b=OujnyP1dg6lqmC8kZZiCTO1wgszygtrELBoTlk8ruVtMnqwkmaRE94NsisWM00EkB6
         ta6034Mup+v+x8xn0PP4PiFyuKetL1Cg3HnhBih26P2StEdxLyLeJMBd2JlB3JdhecNd
         WZRQ1RbnOk4HS//nKv0CxCbDCDdSHbSjtGz41gyjdriFzmYxmOFplmEe4VcVsO77YTBI
         hW3qSp7ppX30gdxfgEwoSAOUuaoHAjynboI6P4dcgYOQq/ZUT6Hsoq6X3UA4Wk8kyDA4
         loucDob5Lzr0hrMefnB61zcPFft8Pz6nSnuL5stkg6m/a0E2IE9edB/2yhSYrakMrqHI
         SUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=x1kEm+S5OsOaHkiRPMyUbNHaNB8lf2nECbZNb+CoAPU=;
        fh=j6iHk4AM1YLyf3OKqmaqFME8jWgLEGKdCamY6HxTIrM=;
        b=avhcOA7kB+lA7frAhvrb2e4nBriL3eDWql9DgTwPsZqQ0HnoBiF1848UqacMB2ZPLz
         KvCvjVfXJlg6NGiwklkhp+7bnfdGq7ZxnB2TWCYoZnIZjv/Jg/gh8IJJZoyY59q7f4Cx
         AbkWTAzNdegqeOsYiLbDBMLGK+ergpnDsMSBLEG6E/GX2MZ+kvQkAHISiVcKKIer2SSP
         kYUMGO0tZ2Ev/x9xv7dzEa8V/6JNmXHgmJfKo79SGsHGLKSCGUuuOSO/ERL+1bgj2xfg
         HhrYPHMcj/Ls9vafy5MWoOI0cOG9AWu6vs7ymMs9Fa5WwfcwwaNOwObqOq3PCLx8/NjM
         ft0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=iPa67fSX;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=iPa67fSX;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443272dd7si992406085a.442.2025.07.01.11.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 11:30:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=iPa67fSX;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=iPa67fSX;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWfjr-0003Wt-G3; Tue, 01 Jul 2025 14:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1uWfjk-0003W2-UH
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 14:29:44 -0400
Received: from smtp-out2.suse.de ([195.135.223.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1uWfji-0007bT-KT
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 14:29:44 -0400
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F47E1F445;
 Tue,  1 Jul 2025 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751394581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1kEm+S5OsOaHkiRPMyUbNHaNB8lf2nECbZNb+CoAPU=;
 b=iPa67fSXhzXq/t8ti+mOnvT6Lsg05UtZ0SGJZDLpT1MN2p8otqGmIhsTz0PDKJ8CLJXx4x
 Q8cZ/Ak83M11CSyweKC/VbugcCuY1bS4grSCGMgojKuT2+A/wFK4a3LOvjy7XHNSQxlBOR
 5tlMwFKG3LOI2ms+/CtBGguO9Ms/7rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751394581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1kEm+S5OsOaHkiRPMyUbNHaNB8lf2nECbZNb+CoAPU=;
 b=zONuhE5IKyAGJfrjSvJvzYhOTtHOvv11vCPJHTkiBCEIC9esM3qkov+1WZxaCyT2qSZibX
 Q6FWEkUi0NXqerBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iPa67fSX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zONuhE5I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751394581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1kEm+S5OsOaHkiRPMyUbNHaNB8lf2nECbZNb+CoAPU=;
 b=iPa67fSXhzXq/t8ti+mOnvT6Lsg05UtZ0SGJZDLpT1MN2p8otqGmIhsTz0PDKJ8CLJXx4x
 Q8cZ/Ak83M11CSyweKC/VbugcCuY1bS4grSCGMgojKuT2+A/wFK4a3LOvjy7XHNSQxlBOR
 5tlMwFKG3LOI2ms+/CtBGguO9Ms/7rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751394581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1kEm+S5OsOaHkiRPMyUbNHaNB8lf2nECbZNb+CoAPU=;
 b=zONuhE5IKyAGJfrjSvJvzYhOTtHOvv11vCPJHTkiBCEIC9esM3qkov+1WZxaCyT2qSZibX
 Q6FWEkUi0NXqerBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B13B01364B;
 Tue,  1 Jul 2025 18:29:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HYTUGxQpZGj3VgAAD6G6ig
 (envelope-from <farosas@suse.de>); Tue, 01 Jul 2025 18:29:40 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Alex Williamson
 <alex.williamson@redhat.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Avihai Horon
 <avihaih@nvidia.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/3] vfio/migration: Add
 x-migration-load-config-after-iter VFIO property
In-Reply-To: <22e94f25448f9ff42b84c84df3960c4ecc94cbdc.1750787338.git.maciej.szmigiero@oracle.com>
References: <cover.1750787338.git.maciej.szmigiero@oracle.com>
 <22e94f25448f9ff42b84c84df3960c4ecc94cbdc.1750787338.git.maciej.szmigiero@oracle.com>
Date: Tue, 01 Jul 2025 15:29:37 -0300
Message-ID: <871pqz69ym.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4F47E1F445
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.44 / 50.00]; BAYES_HAM(-2.93)[99.69%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,oracle.com:email,szmigiero.name:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -6.44
Received-SPF: pass client-ip=195.135.223.131; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: b2rCkG4CiACg

"Maciej S. Szmigiero" <mail@maciej.szmigiero.name> writes:

> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>
> This property allows configuring whether to start the config load only
> after all iterables were loaded.
> Such interlocking is required for ARM64 due to this platform VFIO
> dependency on interrupt controller being loaded first.
>
> The property defaults to AUTO, which means ON for ARM, OFF for other
> platforms.
>
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
