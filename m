Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3350254dye;
        Tue, 1 Jul 2025 11:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXceeJKEAfjDeElje6aRSqcD8JW638CEF7//rpR5MyTSIoS7A9PE9Upk5PJvQAQTm/N8FCbCRgvYAFf8A==@linaro.org
X-Google-Smtp-Source: AGHT+IGJ/ge8TPfmTkuOhzl1RghozVfZqx2Rxr6944Nyr7vfEP2P5Z2KASbUuKAgRfaIy692z5sL
X-Received: by 2002:a05:620a:29cc:b0:7ca:f039:d471 with SMTP id af79cd13be357-7d4439b800emr2560819485a.52.1751394638550;
        Tue, 01 Jul 2025 11:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751394638; cv=none;
        d=google.com; s=arc-20240605;
        b=it28XpPa6GXbI4ncbckCpr5ItWajonJq6aq8aRTg67RrZFlFjZiCv3XamdxgQQ/R+M
         FOHF9suJc5zXq6qXnoL1ludkcSUd/5fAargSxgB2NB2NxngJLZkX9EmM1bNCOweDkEsZ
         gQZA2IeJS1zztsJjYa/SP8jVDdv/b3OJzXVEDEeVK8JM1c/3VdN3eou+F9BRJU+F6T5T
         HyEN8GNk32LtXH+8necaqgfDz5d3lGebq+BajnoHLuejRI/OMhpqhyCOb1dTIeMbwo4v
         BjLswbcsrBAxn07DJSTNK80rLi0ZDQ4WK3CcGZVY6cN8fvpp6hOP1Qwkd3TiSit6hnxV
         eTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=d79TSWiDh+xge6JXemda2+oiMNoylXzkzIvtKGg7+CU=;
        fh=j6iHk4AM1YLyf3OKqmaqFME8jWgLEGKdCamY6HxTIrM=;
        b=BM9e9BHsEFB6VuG60OjrB5JBGoZK4o0FcDp/uhJXzUPHl1Ni4JIl3Zl6f23EH3R3VC
         DHYz+aofiPrRWnMOx1HWb74LW47ECV98s6AJ66CDvpwR9K7HPyKkwLnjdWjE7jV0XcYZ
         B+YGmrwZSihpDoZnQz6hv9I6K1uUBb8i/5osIpQwt+Xj9vwi0EY/Iba/QrAeWrxCX8QD
         d3yMt6mT2Up4Oob6iqo72fFpXoiJgbWErLzpq/QMgRKxhKLB7Mmacgxss7SlQOnIKGoI
         LvpDQp0aaepY9mgha5l8t4GoebdBGzjZDzMPUIHgPzqwTMnif28NrAJfx2EXjRuZvX9h
         +j0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=U5WM3m7a;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=U5WM3m7a;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44319310esi1017983585a.4.2025.07.01.11.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 11:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=U5WM3m7a;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=U5WM3m7a;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWfjx-0003Z1-AH; Tue, 01 Jul 2025 14:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1uWfju-0003Y1-IG
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 14:29:54 -0400
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1uWfjt-0007cy-2U
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 14:29:54 -0400
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C377F1F445;
 Tue,  1 Jul 2025 18:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751394591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d79TSWiDh+xge6JXemda2+oiMNoylXzkzIvtKGg7+CU=;
 b=U5WM3m7a0crsOWo5YBLk3M28iyuwFlptVaX9Xl4FG6LI3V9tsgHEDdEl/E0RVxlUUbWT3s
 sIDHWw9HBgFIUFs422MD2eMwO/H+d9KqqMaTLxo8kiSXahCsa5r44Z5LuQusklmdnHRIWO
 iQ+1emPEThPJpvodp7Eyk6LlWrj1Fe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751394591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d79TSWiDh+xge6JXemda2+oiMNoylXzkzIvtKGg7+CU=;
 b=NS+SoitOmdPortQfDRRbFA1BBJVdJoJ1GJ2pRhI1nrMuQ6+7tSonwQv7KlmSk+mpwqdQBj
 ZEmnuKTaREWBX5Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751394591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d79TSWiDh+xge6JXemda2+oiMNoylXzkzIvtKGg7+CU=;
 b=U5WM3m7a0crsOWo5YBLk3M28iyuwFlptVaX9Xl4FG6LI3V9tsgHEDdEl/E0RVxlUUbWT3s
 sIDHWw9HBgFIUFs422MD2eMwO/H+d9KqqMaTLxo8kiSXahCsa5r44Z5LuQusklmdnHRIWO
 iQ+1emPEThPJpvodp7Eyk6LlWrj1Fe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751394591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d79TSWiDh+xge6JXemda2+oiMNoylXzkzIvtKGg7+CU=;
 b=NS+SoitOmdPortQfDRRbFA1BBJVdJoJ1GJ2pRhI1nrMuQ6+7tSonwQv7KlmSk+mpwqdQBj
 ZEmnuKTaREWBX5Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CAAF1364B;
 Tue,  1 Jul 2025 18:29:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PSHiOh4pZGgAVwAAD6G6ig
 (envelope-from <farosas@suse.de>); Tue, 01 Jul 2025 18:29:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Alex Williamson
 <alex.williamson@redhat.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Avihai Horon
 <avihaih@nvidia.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] vfio/migration: Add also max in-flight VFIO device
 state buffers size limit
In-Reply-To: <65a132db72807ec6341015e7079b10352d718b96.1750787338.git.maciej.szmigiero@oracle.com>
References: <cover.1750787338.git.maciej.szmigiero@oracle.com>
 <65a132db72807ec6341015e7079b10352d718b96.1750787338.git.maciej.szmigiero@oracle.com>
Date: Tue, 01 Jul 2025 15:29:48 -0300
Message-ID: <87y0t74vdv.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid, oracle.com:email, szmigiero.name:email]
X-Spam-Score: -4.30
Received-SPF: pass client-ip=2a07:de40:b251:101:10:150:64:2;
 envelope-from=farosas@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: Mp0ErgE1Xyh/

"Maciej S. Szmigiero" <mail@maciej.szmigiero.name> writes:

> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>
> There's already a max in-flight VFIO device state buffers *count* limit,
> add also max queued buffers *size* limit.
>
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
