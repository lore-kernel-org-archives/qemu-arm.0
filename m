Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1804776njc;
        Tue, 11 Mar 2025 05:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8Vsekh+VlB4VT8r9X6RrRV9aQzyKcmljFvo8QgdPYKCujTHh6FoljbeXZnFGKRo+Wvmp20dJ5VvtdWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFZgWYeEM+BAetmoc8vE92bg0vr0DGK/lpYZL2zBq3miGwCZKZ4oly1X2Bm6F7OTIAyt0QD
X-Received: by 2002:a05:620a:480b:b0:7c3:9cc2:7825 with SMTP id af79cd13be357-7c55eec0bffmr459566885a.4.1741695589568;
        Tue, 11 Mar 2025 05:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741695589; cv=none;
        d=google.com; s=arc-20240605;
        b=XFK8n0QZ8ApVhWe0jb4eHcHAcX222DJUWtgPhd6ssivSf+UIyVS3hSiS3zl9f9qSlD
         5VMjwkPqSHdda3zm5qWpF7wdXOe5pvlELkun3GlY3ajKcbyWdrC8sWYvJwuekX+W2hLO
         xNdecWEYIhURxxwaBvv/TCeeuK6xQIp5VWGeFd2NnfYvFPPDeWFNZKpx9EA8/RS4oFGw
         +E6Jha+rUhIw5erJnX6qxlgU1Fwc1E5UkIeVB8z7MkguBfbpxEyKlPKi/x7DypYYLRQx
         LaWSe9/j7fiGKkRRWv41vBlfI5Ubpct1HME3ZZh9tOgZ9mSVNYH6v0llK8YXJTV84lDW
         3Ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=EiZpeww4Mx7Gj7kfyq2EUg7U9JiLWA7WC20++itRYxQ=;
        fh=sOohlxHJFAeXqewB6ffSrGy3epZCBMM07NE6ykD/1CE=;
        b=VHOCCMhhGsS0C2s62pSkzQMjCrFrEZWoy/PVTNT+ZCJvw2LqIh/M1mPfzIAtKnPX+e
         /DMCPLuMbuxW6PkT6nAtWH8cSZObd0lkeHOTCryvoi/IN+Y7lIB+DOtwKsO3BfXuJn9J
         9WPsO4bnMBND07YKpc/3ktcU0jSwkSE5RESXWnZ45UkVjsfTxwmLrlo7S+/p0q0GwYks
         4ZlZJxDw6Qffx78EAYR8A0zJTmgbsB2O3xoCppNlCpLMqq8tLyRKpEPWspT2TJLn7LK+
         erx13iUbPKdQ+HWn9tgQoO1nVhvc14WXFWJOJYH2sUYM8kqMh2+2lBy9qtf7gPft3XmH
         Bclw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=W30Hb2wg;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=W30Hb2wg;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c54780bd75si603149185a.412.2025.03.11.05.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 05:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=W30Hb2wg;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=W30Hb2wg;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tryZd-0006zs-Om; Tue, 11 Mar 2025 08:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1tryZZ-0006zP-6c
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 08:19:04 -0400
Received: from smtp-out1.suse.de ([195.135.223.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1tryZP-0008G1-3s
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 08:18:57 -0400
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE90B21175;
 Tue, 11 Mar 2025 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741695526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EiZpeww4Mx7Gj7kfyq2EUg7U9JiLWA7WC20++itRYxQ=;
 b=W30Hb2wgX1/zn+2pgWtwHHQ02fjaaD30CtFqL3HQS1FG1RMPiqXDHSsVa2p92Kjyy5y4rb
 z/5TECd7DnDPfdEt0iP5C8l2Q/Hn5fcIUrJj9IzG4zBG6VPViI/M5IJoyKoXQ08bcQnJ00
 Fu9bEk8ohj4SQulVyKgDNI1Y2uWqbJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741695526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EiZpeww4Mx7Gj7kfyq2EUg7U9JiLWA7WC20++itRYxQ=;
 b=EGIclWKoo6DxbPK2qPWty0xOSoEyDW7/kf8W3gB/del/nGsU8sCyJUhFkXqhfPFZyQGqpq
 YdETIpc5X5z86ADA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741695526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EiZpeww4Mx7Gj7kfyq2EUg7U9JiLWA7WC20++itRYxQ=;
 b=W30Hb2wgX1/zn+2pgWtwHHQ02fjaaD30CtFqL3HQS1FG1RMPiqXDHSsVa2p92Kjyy5y4rb
 z/5TECd7DnDPfdEt0iP5C8l2Q/Hn5fcIUrJj9IzG4zBG6VPViI/M5IJoyKoXQ08bcQnJ00
 Fu9bEk8ohj4SQulVyKgDNI1Y2uWqbJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741695526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EiZpeww4Mx7Gj7kfyq2EUg7U9JiLWA7WC20++itRYxQ=;
 b=EGIclWKoo6DxbPK2qPWty0xOSoEyDW7/kf8W3gB/del/nGsU8sCyJUhFkXqhfPFZyQGqpq
 YdETIpc5X5z86ADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C10C132CB;
 Tue, 11 Mar 2025 12:18:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nypLOiUq0GeFLgAAD6G6ig
 (envelope-from <farosas@suse.de>); Tue, 11 Mar 2025 12:18:45 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jean-Christophe Dubois
 <jcd@tribudubois.net>, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Andrey
 Smirnov <andrew.smirnov@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v2 18/18] hw/rtc: Add Ricoh RS5C372 RTC emulation
In-Reply-To: <20250223114708.1780-19-shentey@gmail.com>
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-19-shentey@gmail.com>
Date: Tue, 11 Mar 2025 09:18:43 -0300
Message-ID: <878qpbahgc.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Score: -2.04
X-Spamd-Result: default: False [-2.04 / 50.00]; BAYES_HAM(-2.24)[96.41%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com,nongnu.org]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,tribudubois.net,nongnu.org,linaro.org,gmail.com,alistair23.me];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
Received-SPF: pass client-ip=195.135.223.130; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Njw9Bv9GbvAR

Bernhard Beschow <shentey@gmail.com> writes:

> The implementation just allows Linux to determine date and time.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

For qtest:

Acked-by: Fabiano Rosas <farosas@suse.de>
