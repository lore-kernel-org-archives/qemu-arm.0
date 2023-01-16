Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1413488ejc;
        Mon, 16 Jan 2023 05:48:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvDD3xWVOR7+5UQwv+Oc1GM/4OrUPpM56hd658iGv3OjVwj75l583Kxnu+h8VpWzVKwRuq1
X-Received: by 2002:adf:f44f:0:b0:2bd:c6ce:7bf9 with SMTP id f15-20020adff44f000000b002bdc6ce7bf9mr16052304wrp.33.1673876913647;
        Mon, 16 Jan 2023 05:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673876913; cv=none;
        d=google.com; s=arc-20160816;
        b=R4GbtBS61rnbmDKOlIZB0kmrpPAMsbeUR4DCk/WOSMEM0biAeCtSCLkghIYCDXRD86
         RYjZMevUQ7qmSr++VUUHCTaufB76mWzX2TUMo9gzaQTLbeeNIPFw/S1hVBQBgp20SaHI
         gFPbkTljXeFl0m1D0q/VERxkWvl6wfg7nL5vqvHXe18EjoVjR/eT+sZbj0aO2+HFB31q
         1vxfkDV//a1AJ+9SvApNFtrDj8huMlj1QAu4JUD0vkrLTieThTVtArirbD23iY1eZwuw
         /vrLNaghquij20KaoFUiN2p38AABi+B8/MR2xgCsbyOu1ryqeTstRkfiH4KasQoWfjW4
         6f+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=2n7LBwL7ufHu0ZK/c8vwlNZYTcl9jqojEdhcpfG8yk4=;
        b=ypy6xH4umHsP1G6to1EquOil6MqhD1ZI2i8+8byswUX9j6LbjJAtkH9I0Y9xn+Gr6Z
         EAzBG9mMFKBAz7CKJ9adUFPXyrvB+uPPAQF45SKq+bUwEO5HUBau4lX7B1sX7UqkrbKd
         82E5MQPDDP0muJdl8jP2HzCXxo3mmG2eRbMQSjvB/Rewyfm8XA3ZlxfMLHEQldjSKSPu
         75Bw8/+QukSPaa4BDPuWmuCVAoyAOGwS2c1JcP0Oun0DVdMfrfJZwOqNSwFN9Jpf1HTx
         GAm66CEJC47FtPxvW6aVOHav45iV/RNSKqcYRR7BXfe5A89OUmliUO+hg9J5mqxqmAsL
         yK9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ROZUaknf;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=IGOGgpR8;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id u2-20020adff882000000b0028f4168a80esi25532178wrp.520.2023.01.16.05.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 05:48:33 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ROZUaknf;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=IGOGgpR8;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 398E337610;
	Mon, 16 Jan 2023 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673876913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2n7LBwL7ufHu0ZK/c8vwlNZYTcl9jqojEdhcpfG8yk4=;
	b=ROZUaknf8C7UdB2y4S0kVOPhKOCE8ogmIvhdMo67s9vylwyjySfeIe196FVJ4Qu0kzJ6M6
	t6Cm+YDK0MQS/7ezu3AJtHbnYQjkFazBejBsm0K2j/NxtUEsLB5M07FB7Wmg+Pb8Ib3HUm
	XUAFAsQAYYqHQhMll54tddK0HnKsrbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673876913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2n7LBwL7ufHu0ZK/c8vwlNZYTcl9jqojEdhcpfG8yk4=;
	b=IGOGgpR8Zwcjlys8bsa9/NUNcmHtXRhPPtK3+zC5LWMtAf6lixiT4sYCuJjwpjab80E35D
	r/iiA7vmiYKTzjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA734138FE;
	Mon, 16 Jan 2023 13:48:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FHYSIbBVxWP4SgAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 16 Jan 2023 13:48:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
In-Reply-To: <870053e2-f9e1-3048-c80e-687a13ccdf9f@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
 <870053e2-f9e1-3048-c80e-687a13ccdf9f@linaro.org>
Date: Mon, 16 Jan 2023 10:48:30 -0300
Message-ID: <871qnuzj2p.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: ksRO0UWrRBGY

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/13/23 06:04, Fabiano Rosas wrote:
>> @@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
>>   {
>>       QTestState *qts;
>>   
>> +    if (tcg_disabled()) {
>> +        g_test_skip("TCG support is disabled in this build");
>> +        return;
>> +    }
>> +
>>       qts = qtest_init(MACHINE "-cpu max,sve=off");
>>   
>>       /* SVE is off, so the map should be empty. */
>
> This should work with kvm as well.
> It should always be ok to turn off an unsupported feature.

This test forces -accel tcg. There's another one that uses -accel kvm:
sve_tests_sve_off_kvm
