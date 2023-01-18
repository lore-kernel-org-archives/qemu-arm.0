Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp467247ejc;
        Wed, 18 Jan 2023 04:46:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXszrySIZxhSZdNjFJPrL4/byZcUL4yLNkl2s2WvLBLmsR09wrrVn+e3Lv9AUpfW+qCQ6m6w
X-Received: by 2002:a17:906:9405:b0:859:1a3c:8b5c with SMTP id q5-20020a170906940500b008591a3c8b5cmr7024534ejx.53.1674045983624;
        Wed, 18 Jan 2023 04:46:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674045983; cv=none;
        d=google.com; s=arc-20160816;
        b=SBJa9ojdBS/rf150y9sVM2wDenfac7RSttmk0mGboiI0yGFBruBu90CgSrldDP3N5B
         oqJaBCk0z3U2FGTW48x3QcwlbVM+liubMA43PUcXkaXjun0FOgN7pfUJjvoPKwSgeGMW
         jeJQUUXllmAKMd6YOfkpbFUsh1Nl+HOsnqyNulwZLuFQi5ZBJr9fiduZupQNfU9PO2Ih
         fC3xHrGrVmimNJ2QS/jUtjgB182hgSS2aOPFiuAQyaDi3FGD+dgHfvL5W7r4JKggbr/3
         4oFx7eGWNR1BP6pnqBsUsIUc7flPhSgyAzl6ipZl/hkfyqugsU473alshLvP8xZsDb0Z
         Wh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=CzzW5KC7SS4dxc5epZcneRLL0zjUBBAQSWbpXhTvOxo=;
        b=Q/sP30bK9M/Vyv1IHY6+htVXDc6khOlMvsqdQR8UXO1mJ95OiX9zb2HK3/gvyZ9fwI
         BENbxAz63v2lD6XSfiPXJXFm3oRi4iEy+HziR1RR0/nKY2iHza/1UtQ647b6AC5Pn6Ci
         1/P3uVVm/aptfxAuGalouw31GHuH4GngIJ5WJ2gPmKjCSuL7wU5G6uswOICOMeeO9OQU
         nkSd1EX6u+HGQsXLrG55KrGKbnWximBcrx8PMT9jQ31FvlT/sNh5t2G/jmaNVvTKLMlw
         /rV7Hd6Z30neLQD/D3hYQFsiebLA6uTJjOj0YF7VxEN1fHPnGcVDU6jDsSmDJlHYCbm+
         BIhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cR8Bf1I8;
       dkim=neutral (no key) header.i=@suse.de header.b=Up3iUQcF;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id gs8-20020a1709072d0800b0085a483a6fcdsi29361949ejc.311.2023.01.18.04.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 04:46:23 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cR8Bf1I8;
       dkim=neutral (no key) header.i=@suse.de header.b=Up3iUQcF;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2B483F6B3;
	Wed, 18 Jan 2023 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674045982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CzzW5KC7SS4dxc5epZcneRLL0zjUBBAQSWbpXhTvOxo=;
	b=cR8Bf1I8+gF6myx0UIl0ShbgnVFi/zFalEBUXdf1NOBwrdKwcel0Jzam2N3rKYeBKvfkKF
	/6+RDh+ADjHbSgLhL2iuAXgDH776B2/q32a5iBI0Z14SZuyH+3KOv2etJvusaYY10Sh7OB
	XPUYYkKf6ZRRhwsPR9GIYFV6w8vqVTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674045982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CzzW5KC7SS4dxc5epZcneRLL0zjUBBAQSWbpXhTvOxo=;
	b=Up3iUQcFe7cy5XXLrjUrrMn5rYlLSN6iIJT6K7cJD2hJaKyrrECnARpDwdpXNxZ8bKklRt
	CZlDOMmh6qruxPBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 509A7138FE;
	Wed, 18 Jan 2023 12:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dP7MBh7qx2OAJwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 12:46:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
In-Reply-To: <d1edb6d0-2bb9-4923-ea0f-378b6f944fed@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <d1edb6d0-2bb9-4923-ea0f-378b6f944fed@linaro.org>
Date: Wed, 18 Jan 2023 09:46:19 -0300
Message-ID: <87h6woc8o4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: n0xpfKxO4o4O

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/13/23 06:04, Fabiano Rosas wrote:
>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>> code that is needed for cpus that also work with KVM into cpu.c.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu_tcg.c | 77 --------------------------------------------
>>   2 files changed, 76 insertions(+), 77 deletions(-)
>
> Actually, not true.  This is tcg-only.  As is the bulk of aarch64_max_initfn from which 
> this is called -- note the first 4 lines of that function:
>
>      if (kvm_enabled() || hvf_enabled()) {
>          /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
>          aarch64_host_initfn(obj);
>          return;
>      }
>
> Thus the rest of the function is only reachable for tcg.

Sigh... It seems it's not that simple:

We can currently have a QEMU invocation with "-accel qtest -cpu max" and
no other accelerator. Currently, it falls into this implicit else
branch. So this is actually "else if (tcg_enabled() || qtest_enabled())".

If I move the "TCG-only" code under CONFIG_TCG, the qtests that use -cpu
max will break.

So I have chosen to move the code which depends on aa32_max_features as
you suggest into tcg/ but kept the cortex-a57 as a baseline for
qtest. This has the effect of causing "-cpu max" for the tests to be a
slightly different CPU depending on whether TCG is built in (which
perhaps is ok because if the tests depended on cpu features they should
specify an accel?).
