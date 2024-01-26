Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp883096ejc;
        Fri, 26 Jan 2024 05:45:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1+g7POmm04AjrAO6ZxYxyfzwGRuo8aaGEdmN8w4A/0vLNnAH+zpJYfM6AkkPMDmAt40Vu
X-Received: by 2002:a05:620a:8405:b0:783:3443:7f55 with SMTP id pc5-20020a05620a840500b0078334437f55mr1419049qkn.122.1706276710834;
        Fri, 26 Jan 2024 05:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706276710; cv=none;
        d=google.com; s=arc-20160816;
        b=ECT1gIOvtkn1+CAuhgt5+ZDTG2XuFe4Nl9QtzYBQKJqYkdG/G9LmTCoN4ICTTqcpsb
         vkGrlsw9G6vWq7Ukvv8TluL5U/i5QEMpcPARTAAlWQwZn68LSBlAHCziZkDrU46D/I8z
         0YQLnOwPb2hf40i0+d8o74Yc12ItqFJiVs435rvkKRTi3Fetg9pKFLiAO9vGo3J7UAri
         2Nvw5fF0svOw7scEEwN4Iv3fDYzEvM5JOggXASOAlYZwkjNCUQJXg4AyBZ5YATk134BT
         is6D8+w5LPYwxTI7m+yGA9H0duvxpSBwe2uVbiDxxtM9VhO/yNs3PioUESZno3ZgTY2Y
         Pgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=jYCdoo1/ML4mpV15mPHcpw6eJgaLMiEqa8u7VTr70k4=;
        fh=pk/pnxjb8qUNYbjtCjkewjsPeJRYgVqHLsvoLzJaRVE=;
        b=sOnFu3qmMfzjq6kNUIYnwbzTsd8oxx/YG5O303u4xAVCUpUZ+2pz2BsgsVMb1ZEefj
         jq3b+hSCFH46sJjRydKDJGnv6igc/3fiKwI5DS8ivQiXNRNcBgq1A1OTtIf5HNKY0eRS
         tEOrJ0V/o6gszElARR+3Xq7C6MM7bmCHmcqFpHOuDnNrUCRkoyPXAzds40Sws9kM3EmN
         PO6JfEG03URxq1xUBbfh8SVeaF/JFf/TBlUkbSgbJK+IMeOUgOkdE7JX8zs6BdW02r2S
         F2CZIK6rgSG7M8LOQuWLJVW/YixbklaUf8jypaBLFPwdiP1phjBKf62zoTSlVXhnY4DS
         o/jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XHnZRhJh;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XHnZRhJh;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt41-20020a05620a47a900b00783dae58180si549997qkb.188.2024.01.26.05.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:45:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XHnZRhJh;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XHnZRhJh;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTMVw-0006KN-PX; Fri, 26 Jan 2024 08:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1rTMVv-0006Ja-EE; Fri, 26 Jan 2024 08:44:59 -0500
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1rTMVt-00037B-Op; Fri, 26 Jan 2024 08:44:59 -0500
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A46F222336;
 Fri, 26 Jan 2024 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706276693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYCdoo1/ML4mpV15mPHcpw6eJgaLMiEqa8u7VTr70k4=;
 b=XHnZRhJhMoSjnZW+MS0+wZnhXEVL1xPHobUdg+g8gtPgNyuF213/yC185feTi4lQ69K5LF
 SpXJHSPdZDfpxfuiIsPSu6O2DDWRHjRkGlSTQgnT1cv9PcmyvVUUf7PDD8q4PErE80e+e2
 saRVfAiQa311aiKTL7pW48wRWdxyaqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706276693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYCdoo1/ML4mpV15mPHcpw6eJgaLMiEqa8u7VTr70k4=;
 b=UFjAEH3S7/3+ydO2FkTBAm5Np+TSdwPu90vgBqsDZq323qA0Z866eg+AL2KSliJxSEeFVj
 olGh8HbnCATQ7kBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706276693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYCdoo1/ML4mpV15mPHcpw6eJgaLMiEqa8u7VTr70k4=;
 b=XHnZRhJhMoSjnZW+MS0+wZnhXEVL1xPHobUdg+g8gtPgNyuF213/yC185feTi4lQ69K5LF
 SpXJHSPdZDfpxfuiIsPSu6O2DDWRHjRkGlSTQgnT1cv9PcmyvVUUf7PDD8q4PErE80e+e2
 saRVfAiQa311aiKTL7pW48wRWdxyaqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706276693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYCdoo1/ML4mpV15mPHcpw6eJgaLMiEqa8u7VTr70k4=;
 b=UFjAEH3S7/3+ydO2FkTBAm5Np+TSdwPu90vgBqsDZq323qA0Z866eg+AL2KSliJxSEeFVj
 olGh8HbnCATQ7kBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 31500134C3;
 Fri, 26 Jan 2024 13:44:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id udZiOlS3s2UQYwAAD6G6ig
 (envelope-from <farosas@suse.de>); Fri, 26 Jan 2024 13:44:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 0/3] target/arm: Allow compilation without CONFIG_ARM_V7M
In-Reply-To: <20240126084001.879548-1-thuth@redhat.com>
References: <20240126084001.879548-1-thuth@redhat.com>
Date: Fri, 26 Jan 2024 10:44:50 -0300
Message-ID: <87plxo6wfh.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XHnZRhJh;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UFjAEH3S
X-Spamd-Result: default: False [-3.05 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 BAYES_HAM(-2.74)[98.86%]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A46F222336
X-Spam-Score: -3.05
Received-SPF: pass client-ip=2a07:de40:b251:101:10:150:64:1;
 envelope-from=farosas@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 28yY/r31eWXU

Thomas Huth <thuth@redhat.com> writes:

> We've got a switch to disable v7m code since a long time - but it
> currently cannot be disabled since linking then fails due to missing
> functions. But thanks to the clean-ups that have been done during the
> past years, it's not that difficult anymore to finally make it possible
> to disable CONFIG_ARM_V7M: We just have to move some v7m-related code
> out of cpu32.c to a separate file (that we only compile if the switch
> CONFIG_ARM_V7M is enabled) and make sure to use the stub functions in
> m_helper.c if it is disabled. Then we can finally remove the hard-coded
> "select ARM_V7M" from the Kconfig file.
>
> Thomas Huth (3):
>   target/arm: Move v7m-related code from cpu32.c into a separate file
>   target/arm/tcg/m_helper.c: Include the full helpers only with
>     CONFIG_ARM_V7M
>   target/arm/Kconfig: Stop requiring CONFIG_ARM_V7M
>
>  target/arm/tcg/cpu-v7m.c   | 292 +++++++++++++++++++++++++++++++++++++
>  target/arm/tcg/cpu32.c     | 261 ---------------------------------
>  target/arm/tcg/m_helper.c  |   3 +-
>  target/arm/Kconfig         |   4 -
>  target/arm/tcg/meson.build |   4 +
>  5 files changed, 298 insertions(+), 266 deletions(-)
>  create mode 100644 target/arm/tcg/cpu-v7m.c

Tested-by: Fabiano Rosas <farosas@suse.de>
