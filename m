Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp522175ejb;
        Wed, 29 Mar 2023 06:57:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350acOJLjq2JXjQD1UfSsJl26qf/fc558uTnJQ3mRZOxFhA6axUUhgdIScmH+2dPEe6E3UaLk
X-Received: by 2002:adf:e9c3:0:b0:2da:90a8:7180 with SMTP id l3-20020adfe9c3000000b002da90a87180mr14929765wrn.3.1680098230372;
        Wed, 29 Mar 2023 06:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680098230; cv=none;
        d=google.com; s=arc-20160816;
        b=qQ/3733AEcbJ384kzvijhlCMhNBpmoZoWqTWYbYR6cx86M+dU9R4QD4BS/TOPgawpH
         CMtMUIy6/2wQ7FeV8X3C+7QKOkFXTks86wpJL0Sr4bQ7qflzPmXnG9NnkbCLQAsW4Lje
         /XvH8dlm1KTmtY1boDfGLE5JdKy6RxEr/PmuNXfGXslZZH3GlWhVy1lcf5VhV/BqwsBm
         9aM+X6by939vQxq901gO9EezE8ow+OCSSPJyex30rl8UcVgL0fR8NPNfg+pWBm5MKo6q
         eyVkXDgDb9vf6Motuo9KC56HBwmxjSXU4L4tBqA4mbRRapTOhIYjWDKHmk1ZRHUxMDKz
         SmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=G4zDWPpQKlg/1synQOq2eKCiMKJAG5BFd3bkstfjsAc=;
        b=s4M79jEr/6gLw4XCOaxWIoZCJHZRTHu8Rv/77+qWnWkI4TSr2qhJq0I7foyLdMJVeQ
         5QDlc3rK8ZVXUvUgqFBLAk5uDxuTKK4ycLDQVPDxGO3J2VFsfZ5woTGk/N9Bx/eN4y3A
         oClnxWlCrGYSpcFBnyz5lk8XMWyk2zO0hCc/ON3oSFqYd2KxEIocm+K4kpUUOR2qJpEN
         270hrNZl2J4zmYRY4bNYX7Pu/EGjExgUid8n5xY5WDIIlT28eGU7FwQ5o+PFe8KASlIX
         92KwzgjnDwZXCAlFlE3YBR720PrhZK8vLRb3RSzpeu/CifxhEMwmT0CFw5Oow37SxE1i
         4g3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=AmzL6iqp;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id t15-20020a5d49cf000000b002c58b77e532si28772224wrs.880.2023.03.29.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=AmzL6iqp;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC4B61F7AB;
	Wed, 29 Mar 2023 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680098229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4zDWPpQKlg/1synQOq2eKCiMKJAG5BFd3bkstfjsAc=;
	b=AmzL6iqpeiEK1id6TL32sQnm6Y374nlnEH4osl6hzdXuGdhmbHNJfy+Q2No4asqepf/cy9
	08eRMENqQfxW+9pTmwzMs1f5wp9dh1hx/J+RuH7P7yBn9dqeuAY4QxjeMPs3gpRegi/vH3
	NnRaNflIQV6mJjDgOCJhTGzf9XL1yS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680098229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4zDWPpQKlg/1synQOq2eKCiMKJAG5BFd3bkstfjsAc=;
	b=dmJBKyEsBUIhf/3xrr9UgbldMiNEhI//bUZR++vDYMfWkzRVgwhmiRPUCAWntK/75+zeXS
	R+z/Kyram2p449Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34C04138FF;
	Wed, 29 Mar 2023 13:57:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HfrvOrRDJGSBJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 29 Mar 2023 13:57:08 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, David Gibson
 <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, qemu-ppc@nongnu.org, Yanan Wang
 <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eduardo Habkost
 <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 kvm@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas
 Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?=
 <philmd@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-8.0 v2 1/3] softmmu: Restrict cpu_check_watchpoint /
 address_matches to TCG accel
In-Reply-To: <20230328173117.15226-2-philmd@linaro.org>
References: <20230328173117.15226-1-philmd@linaro.org>
 <20230328173117.15226-2-philmd@linaro.org>
Date: Wed, 29 Mar 2023 10:57:06 -0300
Message-ID: <87v8ijy825.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ToH+5AiWv3y8

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Both cpu_check_watchpoint() and cpu_watchpoint_address_matches()
> are specific to TCG system emulation. Declare them in "tcg-cpu-ops.h"
> to be sure accessing them from non-TCG code is a compilation error.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
