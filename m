Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp238545nji;
        Thu, 11 Jul 2024 08:03:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkm9dLORVXduCZJS9imdiz9tG4R+9BhSrNZxHipYoxbeC0A8u7YQfF5yM2/3w7NrS2nJW/AFQyB0Bq4FPLYnljGD9Unekd
X-Google-Smtp-Source: AGHT+IFBlFs2K01UguDvpe5WBhOdAsu9HljPE2hoaDT8yqpaw35258F/0PE8G7qtjx/2DC2y306F
X-Received: by 2002:a05:620a:51d4:b0:79e:ffce:47df with SMTP id af79cd13be357-79f19c023e0mr828534185a.78.1720710229274;
        Thu, 11 Jul 2024 08:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720710229; cv=none;
        d=google.com; s=arc-20160816;
        b=oTwL1ZTX118W/Mon1Kxg1AsshL2WsDh+yCehBMjeiUV2J4t6AW0ljgsS4QUR9X5z0X
         S0Vwnw38w14RHRGpat+gvYix3yJFiyI7etm01s3kCO29+NGIrPF2MFMjyhTfJdeZvX3N
         E+jtezgXozDJ8XWtLXo0m6HKyawCJ2XSH73L8Zv6WPxzyr3DJkpEOLoFGoFbPCZkOrl7
         G0wcj/zAeInEYnB3DJRPppAQTC9mFIv3Y3Biidt6GGgrgCQnQ9FmLiIa3fDJWJKrUvgn
         K/7pQM0YAECoc3Hsqx5/E0MT9IjA5KANsnTqRpywthGCywU7al2e4yLgBf/6Sn1VPlTT
         ZW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=DeoS6q74J8EhNBBmkO9sdoW6kTsQK0jd5WV/7Jn05vg=;
        fh=umL8zxbWF4W2pS9nVgc4z5DWwZX8pLHcZx531lKXiRo=;
        b=V1HnE/4JJMKqL9Y8MZrr5FaFfKGXpXv6WlFQxYhVVniefev2Hp9qrPmpk3+O1Nb3le
         EenaOtbCEHn6uy2lf13Vk+kZtY7ckXz6Spga2kLQ9ZLh+V+E2/YVGflt/R2sAT+bGpo1
         7CxRLnHYwwZ5hwd8JowhdjEQqMb0gt/7MsUDTkbOqIeHt0UfTdgklx7ekU4DrKcZRmu8
         4QXzrMkhnSpIOHAEvk1DKwaUebI/lSQGUCqj2X4+lGtQpVWuQFzrBepcVIuBiyc63zvM
         sSbno6WP1o5MofrDeQOTvoTw0cQFfczB9IsknPx0KxjeHkzhMhHh2g2oyHKixAqNSAOL
         VW4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DFfO59p9;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DFfO59p9;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190a15bdsi723466485a.326.2024.07.11.08.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 08:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DFfO59p9;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DFfO59p9;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRvKd-0007Z0-IJ; Thu, 11 Jul 2024 11:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1sRvKa-0007X7-UU; Thu, 11 Jul 2024 11:03:38 -0400
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1sRvKY-0007yb-Sc; Thu, 11 Jul 2024 11:03:36 -0400
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 545821F8D9;
 Thu, 11 Jul 2024 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720710211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DeoS6q74J8EhNBBmkO9sdoW6kTsQK0jd5WV/7Jn05vg=;
 b=DFfO59p9dAaM4AgjL54v3G53zzxI3aC4Tkq7edSnYtFbzplgM3zS939oz6pF4Hno2DhHY1
 UhzHG50ccDaqhoqbh548cKCEw5ftfxuznTA40e0kQZqu2BxeXBi+JzL5yaofn4jTfrUvOu
 LEhtTvTRCaapzMR1eoRw4njpuL/FMRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720710211;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DeoS6q74J8EhNBBmkO9sdoW6kTsQK0jd5WV/7Jn05vg=;
 b=AS+Ny8mvL10hv1uxelVAIckG/rlioDY1+tbtQwE6poHP6Wcm9bS2nUF9glfUlo/v/fmzFc
 HfQ6ORvlct1IvgAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DFfO59p9;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AS+Ny8mv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720710211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DeoS6q74J8EhNBBmkO9sdoW6kTsQK0jd5WV/7Jn05vg=;
 b=DFfO59p9dAaM4AgjL54v3G53zzxI3aC4Tkq7edSnYtFbzplgM3zS939oz6pF4Hno2DhHY1
 UhzHG50ccDaqhoqbh548cKCEw5ftfxuznTA40e0kQZqu2BxeXBi+JzL5yaofn4jTfrUvOu
 LEhtTvTRCaapzMR1eoRw4njpuL/FMRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720710211;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DeoS6q74J8EhNBBmkO9sdoW6kTsQK0jd5WV/7Jn05vg=;
 b=AS+Ny8mvL10hv1uxelVAIckG/rlioDY1+tbtQwE6poHP6Wcm9bS2nUF9glfUlo/v/fmzFc
 HfQ6ORvlct1IvgAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C3557136AF;
 Thu, 11 Jul 2024 15:03:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wvMXIkL0j2YcHAAAD6G6ig
 (envelope-from <farosas@suse.de>); Thu, 11 Jul 2024 15:03:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Xu <peterx@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Tyrone Ting
 <kfting@nuvoton.com>, Bin Meng <bmeng.cn@gmail.com>, Hao Wu
 <wuhaotsh@google.com>, Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-arm@nongnu.org, Joel
 Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>, =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on
 block drive (CMD56)
In-Reply-To: <Zo_yuMfEmg0W1msP@x1n>
References: <Zo6iZjc8YpI1_9dW@x1n> <874j8xfc9s.fsf@suse.de>
 <Zo7dcF8OKfH92RlR@x1n> <871q41f2pk.fsf@suse.de> <Zo7rCXtap2lWd4IB@x1n>
 <87ttgxdj1p.fsf@suse.de> <Zo8F4Gq4f7SawaDc@x1n> <87plrkdpd7.fsf@suse.de>
 <Zo_n39Vusyy-O_48@x1n> <87h6cwdm4n.fsf@suse.de> <Zo_yuMfEmg0W1msP@x1n>
Date: Thu, 11 Jul 2024 12:03:28 -0300
Message-ID: <87ed80dl8f.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_TWELVE(0.00)[18];
 FREEMAIL_CC(0.00)[linaro.org,nongnu.org,redhat.com,nuvoton.com,gmail.com,google.com,amd.com,kaod.org,jms.id.au,lists.libvirt.org];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; MISSING_XM_UA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 545821F8D9
Received-SPF: pass client-ip=2a07:de40:b251:101:10:150:64:2;
 envelope-from=farosas@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: E3mBtEWMGeV7

Peter Xu <peterx@redhat.com> writes:

> On Thu, Jul 11, 2024 at 11:44:08AM -0300, Fabiano Rosas wrote:
>> But of course, that means we cannot claim to support all kinds of
>> forward migrations anymore. Only those in the 6 year period.
>
> That "6 years" comes from machine type deprecation period, and migration
> compatibility is mostly only attached to machine types, and we only ever
> allowed migration with the same machine type.
>
> It means, >6 years migration will never work anyway as soon as we start to
> deprecate machine types (irrelevant of any reuse of UNUSED), because the >6
> years machine types will simply be gone.. See configuration_post_load(),
> where it'll throw an error upfront when machine type mismatched.

Yes, duh! What am I talking about...
