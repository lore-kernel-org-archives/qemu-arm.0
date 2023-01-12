Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4833336ejc;
        Thu, 12 Jan 2023 06:49:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvS2mDNcWuA8TtJfg4CWdqKr46slBwdpXVOIy2J/yMGOoOftYSJezCrXOzIB1eFARW/3v6z
X-Received: by 2002:a05:600c:4e47:b0:3d9:e9ef:fa08 with SMTP id e7-20020a05600c4e4700b003d9e9effa08mr13981192wmq.3.1673534998620;
        Thu, 12 Jan 2023 06:49:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673534998; cv=none;
        d=google.com; s=arc-20160816;
        b=xbqLofFy7k1mw4f+/UmrV9ZoPq/3vEvwB64GCRtQZGw2kDAx9kgB1Cc49N0d2D+9fp
         zvgA+sf8L6GMkNtKFiRVBeQuMF4bne0n7huVd5qgUZhZLzCg/dn/R0UvESS7wOfOjW2/
         fF2TF5+nM5Zet9REFKBXsXfC3D5sa/gVMoucy35trudonXsTvXTYPN9+jh6d7cQKKLit
         YrlxbPYHg1aOcLztRlyQxEIXnVo8usbPNuMmn/LixkkzOGTxVQ8YufVdjITmd8Bzc6DP
         11RRfPJQG3/E9nYmoKt6iEXWdUi7TA8ew2Vc31tbPFRTWpzrAkMW4KDlBRIeNNT1W3P+
         1FJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=08hrdMBjSFtZWKMqM4pHo6gTKAlmsb+X47EIQYA/pqU=;
        b=nNkcvYjSKlZE5fZuXas7WEOq4Vx3/4M1EiTedq4jtgDWsRxShE/d2qdJdGxaYRsHER
         HvnMtO4OE5WJPkYcdbEDcbSN4WUbmh8cEdxRCvSx5qK59USpC5SVHpsZDABBDbRM1Lgq
         9W3Kpnqz+Sbb3qpr9ZENcFSm/JlYOOAXyb6bP7fOrXHPvKdXyNjmkyYVGnyNsjJccVS6
         g5+k1W1xQrr1IfflXaxiG/+DwFMVCy2Tq8k9xWUrkolZvFMAw1YBjszMYHtsp8clT9N4
         pAWRxU/nJPhcSF6NBr5O19+721BKw1jSZNpVpf88gqRUqk/NbvXhd7WeZK/q/VQTmWW3
         qM1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=q02d9zxm;
       dkim=neutral (no key) header.i=@suse.de header.b=0zB3BKa3;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id l6-20020a5d6d86000000b002426c59d2f2si16459453wrs.147.2023.01.12.06.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 06:49:58 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=q02d9zxm;
       dkim=neutral (no key) header.i=@suse.de header.b=0zB3BKa3;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EBC003FF9E;
	Thu, 12 Jan 2023 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673534997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08hrdMBjSFtZWKMqM4pHo6gTKAlmsb+X47EIQYA/pqU=;
	b=q02d9zxmNDcfbo+USVqRzCqYyN0k0nk+3JjPMRGhWjlPFGpKiCun0Nc/EVQ/TBO0hmQ9Sf
	rj4KNb0a70SyqCs/PUzr9Gn/vBxbJ2LnzVUCmSLvm3O1JhYhw2Fv0vfdzG7BhKVg54Xllk
	t2C2Tg15fE4Mu3Gj+tB/OyaaDWYniFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673534997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08hrdMBjSFtZWKMqM4pHo6gTKAlmsb+X47EIQYA/pqU=;
	b=0zB3BKa3g4z4GGH9vgCnlAhIOCwY/MofL20DMwErxTmVta+oWzCtu4oQkiH8ugP6Z2c29J
	u2zGSA9Yt/znLBBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77D7A13776;
	Thu, 12 Jan 2023 14:49:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Si9AEBUewGNFEgAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 12 Jan 2023 14:49:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, Claudio Fontana
 <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <214f89fc-6e90-7d0b-8555-4bae1d1d0b70@linaro.org>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de> <87fschcko4.fsf@suse.de>
 <214f89fc-6e90-7d0b-8555-4bae1d1d0b70@linaro.org>
Date: Thu, 12 Jan 2023 11:49:55 -0300
Message-ID: <87fscfhkoc.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: VnfsI3jsvd78

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/11/23 04:36, Fabiano Rosas wrote:
>> Nowadays for KVM is the 'virt' machine the only one we use?
>
> Also sbsa-ref.

It seems not, sbsa_ref_init has this:

if (kvm_enabled()) {
    error_report("sbsa-ref: KVM is not supported for this machine");
    exit(1);
}
