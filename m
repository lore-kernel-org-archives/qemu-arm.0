Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2E6C83F25
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Jul 2025 12:55:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1udq3O-00030D-T1; Mon, 21 Jul 2025 08:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1udq2m-0007QD-Bv
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 08:55:01 -0400
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1udq2k-0006rv-8N
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 08:55:00 -0400
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0974521CC5;
 Mon, 21 Jul 2025 12:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1753102493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Li2wc439Qz7SN0gZ5/PNmCJABCRSBorqD78A2ZMk3QM=;
 b=WK/BhUvQj3C5aTzElzVUv36uN6ofC/1tDadEloNnX0v1EisGagBtbsg3+oHlMQ6CQiQfje
 5nrd3emyQjp/Hcx+b+uy2eDG2Lm2WO6LlGPAPu2AE+A957vpZGZDe/IkHmX3SB/7SA7YeR
 A+VcooJ1iTVxftLC8wDqMM7HuzTKeM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1753102493;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Li2wc439Qz7SN0gZ5/PNmCJABCRSBorqD78A2ZMk3QM=;
 b=YWdkhSLvEwOQeWH0Bvv5bM4Q2X9s8lQJITfKZqncqKR4vPH0aTfkI6ll6OWWhlPBGyAAVq
 kqmh5ofIFnXq99BA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="WK/BhUvQ";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YWdkhSLv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1753102493; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Li2wc439Qz7SN0gZ5/PNmCJABCRSBorqD78A2ZMk3QM=;
 b=WK/BhUvQj3C5aTzElzVUv36uN6ofC/1tDadEloNnX0v1EisGagBtbsg3+oHlMQ6CQiQfje
 5nrd3emyQjp/Hcx+b+uy2eDG2Lm2WO6LlGPAPu2AE+A957vpZGZDe/IkHmX3SB/7SA7YeR
 A+VcooJ1iTVxftLC8wDqMM7HuzTKeM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1753102493;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Li2wc439Qz7SN0gZ5/PNmCJABCRSBorqD78A2ZMk3QM=;
 b=YWdkhSLvEwOQeWH0Bvv5bM4Q2X9s8lQJITfKZqncqKR4vPH0aTfkI6ll6OWWhlPBGyAAVq
 kqmh5ofIFnXq99BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77F4A136A8;
 Mon, 21 Jul 2025 12:54:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kh29DZw4fmiqSAAAD6G6ig
 (envelope-from <farosas@suse.de>); Mon, 21 Jul 2025 12:54:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, Peter Xu
 <peterx@redhat.com>
Subject: Re: migration-compat-aarch64 CI job is failing
In-Reply-To: <ce91740a-b22b-4aa1-b7c6-674dfcd3e2da@redhat.com>
References: <ce91740a-b22b-4aa1-b7c6-674dfcd3e2da@redhat.com>
Date: Mon, 21 Jul 2025 09:54:49 -0300
Message-ID: <87o6tdln52.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 MISSING_XM_UA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 TO_DN_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 URIBL_BLOCKED(0.00)[gitlab.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 0974521CC5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Received-SPF: pass client-ip=2a07:de40:b251:101:10:150:64:1;
 envelope-from=farosas@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

>   Hi,
>
> I just ran the migration-compat-aarch64 CI job manually, but it is 
> apparently (still?) failing:
>
>   https://gitlab.com/thuth/qemu/-/jobs/10751473092
>

Hm.. I shouldn't fail _like that_. I'll take a look.

> I'm not sure whether this job ever worked, is someone still looking into 
> this? If this is not supposed to work and nobody is working on it, could we 
> please remove it from the CI to avoid confusion?
>

The issue was running the test across various setups, TCG, KVM, x86
host, aarch64 host. There was some combination that would break and we
decided to wait for development in target/arm that would provide a
stable cpu definition across TCG and KVM. Or so I remember... I couldn't
find the thread just now.

I'll figure it out.

Thank you for asking, we shouldn't leave it like that indefinitely.

>   Thanks,
>    Thomas

