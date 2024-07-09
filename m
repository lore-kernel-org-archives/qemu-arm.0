Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3518507njb;
        Tue, 9 Jul 2024 13:39:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUELdIQqoWPGKgsiQSHKC3n0MxmPHwplNiDystL8ZIbVqpaUYr9SoLpgpBvVD0D5fcGjT2sLbzH29jEOQJRCCzbbE0nAewj
X-Google-Smtp-Source: AGHT+IFJotuyU5vCniEkMiN4zt5QkfF2H7HMMTGxNjoGfgaebOuyg+oWY4/NmKsbhx+un6rvTXdP
X-Received: by 2002:a05:6102:8026:b0:48f:3b2f:ec33 with SMTP id ada2fe7eead31-49032243be1mr4410472137.31.1720557552378;
        Tue, 09 Jul 2024 13:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720557552; cv=none;
        d=google.com; s=arc-20160816;
        b=C+d619DTPb4TwMorrMN7aaZQD5pQgJWAyplNIFb5LLgmqeazzdnTkASSqViqXNmSLU
         ewkeKZGY6D16Bxc4+bwp77lUM151bL+3GpApHE68BnjAflbdoH8fF58kzcXILbpaMCFw
         lsQdZNCfRUJBa4gWVflDspiJ1Qz+3qOL+qVmdcM3U/+3Px1woc3DEcjUBL0H3y1o576J
         ef2vM/rfP+kSaTvk9tgU56CF8TasN9iiIf2xGnyesTDneKKtT95QM02teOy+idhyP5v0
         hBNNS0o9DmUcQskFCkp3eC5g3Du0+GCOVuXCKQ5pZ/HnncvLKebGUI166i7pN6TBRnyH
         iQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature:dkim-signature:dkim-signature;
        bh=cHpx3n3sHMhIG2L3Bt6G08nwjnQquLAi28nbPztap5E=;
        fh=vNxj2mAnCaG8S01hH+cL7wixWv41Eg/cZQ88N/A6ycE=;
        b=QLSFLH0vibkXzmHC9pycYUerrlwojFNCZt6nwfuEoediBOEhgLqvGxkkpNNvOmQTBZ
         EN4cxWbNCKyqj6S2jIMS71Ro98YEpHPjDGW1eSdsz3MqP1xcvwsBUwDLdK7Su6opcoTk
         fbaHyrrjRvRDFmT8ea3rW/RBWl6BwZ0nq1kvAxYDcDF7rGHlziXDV3Z85qfnv4uMqWYB
         SbaOc2SNzDGaNmXzgQ+1r+Nhkj1nVmDaivoh5fx/S+T1XZV+KowiQHrCS3TosNMxETwA
         9Xa7VsrO7+cuNLIEljeO0A8SbU2UXBEVzIJMtk0LYxP1EXR4DzXY2PIcXfBt5qq1vPmP
         o7rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UyF2CWwM;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UyF2CWwM;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bfc1d4si28688911cf.647.2024.07.09.13.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 13:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UyF2CWwM;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UyF2CWwM;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRHcB-0006Qp-71; Tue, 09 Jul 2024 16:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1sRHc9-0006Ia-95; Tue, 09 Jul 2024 16:39:05 -0400
Received: from smtp-out1.suse.de ([195.135.223.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1sRHc7-0002I6-J1; Tue, 09 Jul 2024 16:39:05 -0400
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD7EB219D6;
 Tue,  9 Jul 2024 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720557537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHpx3n3sHMhIG2L3Bt6G08nwjnQquLAi28nbPztap5E=;
 b=UyF2CWwMDyuYagZGeBl9eVY752HzPnMAKuF1YqMHjTuKC8D4YpLMI3Cq9jhPuDQaBMxR4U
 P5/VNNvg8+hDQ0uXmLOhb895nyCJM+KbnUVxwjLHqSGC1P+ACO2ZjK8cgWiGCS8Jq1qfge
 FdpfHpMNjxKZC6loP9gW5rBDNpgOboE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720557537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHpx3n3sHMhIG2L3Bt6G08nwjnQquLAi28nbPztap5E=;
 b=tduSe96shX1pcu8i3EJTO0O9rL54Ge+ftUBXeAOA1oiX+tOgYZUZ3lcnXUXLF+SVO8xyPv
 KPcBSYGt7xMH0rBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720557537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHpx3n3sHMhIG2L3Bt6G08nwjnQquLAi28nbPztap5E=;
 b=UyF2CWwMDyuYagZGeBl9eVY752HzPnMAKuF1YqMHjTuKC8D4YpLMI3Cq9jhPuDQaBMxR4U
 P5/VNNvg8+hDQ0uXmLOhb895nyCJM+KbnUVxwjLHqSGC1P+ACO2ZjK8cgWiGCS8Jq1qfge
 FdpfHpMNjxKZC6loP9gW5rBDNpgOboE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720557537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHpx3n3sHMhIG2L3Bt6G08nwjnQquLAi28nbPztap5E=;
 b=tduSe96shX1pcu8i3EJTO0O9rL54Ge+ftUBXeAOA1oiX+tOgYZUZ3lcnXUXLF+SVO8xyPv
 KPcBSYGt7xMH0rBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EB411369A;
 Tue,  9 Jul 2024 20:38:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id m/l9BeGfjWaEDAAAD6G6ig
 (envelope-from <farosas@suse.de>); Tue, 09 Jul 2024 20:38:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Tyrone Ting
 <kfting@nuvoton.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng
 <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>, Francisco Iglesias
 <francisco.iglesias@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Thomas
 Huth <thuth@redhat.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu
 <sai.pavan.boddu@amd.com>, devel@lists.libvirt.org, Luc Michel
 <luc.michel@amd.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on
 block drive (CMD56)
In-Reply-To: <20240627162232.80428-7-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
 <20240627162232.80428-7-philmd@linaro.org>
Date: Tue, 09 Jul 2024 17:38:54 -0300
Message-ID: <87cynmfggx.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -2.19
X-Spamd-Result: default: False [-2.19 / 50.00]; BAYES_HAM(-2.39)[97.19%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_TWELVE(0.00)[19];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[nongnu.org,redhat.com,nuvoton.com,linaro.org,gmail.com,google.com,amd.com,kaod.org,jms.id.au,lists.libvirt.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, linaro.org:email]
Received-SPF: pass client-ip=195.135.223.130; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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
X-TUID: jp11/kmbK1Ek

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> "General command" (GEN_CMD, CMD56) is described as:
>
>   GEN_CMD is the same as the single block read or write
>   commands (CMD24 or CMD17). The difference is that [...]
>   the data block is not a memory payload data but has a
>   vendor specific format and meaning.
>
> Thus this block must not be stored overwriting data block
> on underlying storage drive. Keep it in a dedicated
> 'vendor_data[]' array.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Tested-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
> RFC: Is it safe to reuse VMSTATE_UNUSED_V() (which happens
> to be the same size)?

Hi, sorry it took some time to get to this, I had just left for vacation
when you first posted.

I think it's ok:

{
  "field": "unused",
  "version_id": 1,
  "field_exists": false,
  "size": 512
},

vs.

{
  "field": "vendor_data",
  "version_id": 0,
  "field_exists": false,
  "num": 512,
  "size": 1
},

The unused field was introduced in 2016 so there's no chance of
migrating a QEMU that old to/from 9.1.
