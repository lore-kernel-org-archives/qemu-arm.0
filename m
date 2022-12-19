Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3406693ejb;
        Mon, 19 Dec 2022 03:42:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4z34E1zFE3kCz94bp46ZfsOYzcOClFHA1gP2UGp19lQ9CRGNFPXAX3zGOAkPBCwWjnULPo
X-Received: by 2002:a7b:c8c5:0:b0:3d2:3ec4:7eed with SMTP id f5-20020a7bc8c5000000b003d23ec47eedmr12957069wml.10.1671450136813;
        Mon, 19 Dec 2022 03:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671450136; cv=none;
        d=google.com; s=arc-20160816;
        b=a/FO9+2r3J+AkpjUhRAeTHFDrcDNXiAICNXQUVpgBpTTl07S8wry071w1XLyDs7kJZ
         tcLhjzeBeKXTA29X1tTOXHw1++ymnxzNo7uxBbiekHFMrhtT0xbc98XYmxVAg3e0I2ev
         VrNfvi6hCSPHc8NTLLS6BVFsBjoTZhrsRi7O8wWUfs4h/Bi430mC/J+iigKU8Swj75Jp
         TKE7i1UhVOAb4uttOunaBvPjMVjkKq2gQZfiBZxq1ZK8mxq3BX3v68/jrhtSqPW5LH5M
         ylqrVfzB36TlXnF/3p5lerjOkofZkQFP37qXZlC1cpVyyf/s2ZAlFrmlmWCVPdYV6EPo
         gtmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=1Ch9cu30zdymbS4/mu8gbBsWUq8wgD46ogCiJ5XmHdE=;
        b=O+vRsYQ+qvMi4vhfQbldTg9/NP7BED/z0l/pOmvUe2AjQRfsp9d7QDdM9aTVKqnx9D
         0bOXMZVRB1hPbVTPi5/FcHsunY9odZLdClI+M3fYC2VPHN6HjFKJNs2nrbfympv6xfO2
         RQpwqnrV3Dt/0tZTcnNSy0Oyu5wr3/AO7T5UGb0PPeLZjrdBnjpRosUbP0lv53bwdt5j
         EY+eyYqtzbCIcNGJ5NHyrc/SkSluz0bf3tGnVjfsmneF4sHa2fpR8K8HlkdM8Jl2IcdV
         VrUNGNUdtn6Lif867lk9wKLbfjOFbx1bjSBz4O1f905KfSH9XV/hIxSvnJDw1QCxsN+z
         vbNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="I/75ryd5";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id ba8-20020a0560001c0800b0025ecfece1e8si2732910wrb.448.2022.12.19.03.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 03:42:16 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="I/75ryd5";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 31E64606EA;
	Mon, 19 Dec 2022 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671450136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ch9cu30zdymbS4/mu8gbBsWUq8wgD46ogCiJ5XmHdE=;
	b=I/75ryd5gGKvQ3d+qIXOqYPQdaKXxdKMV+3oSSb5GWCd6hvKOT+Aykfl4xq8cIAiO0hVgV
	iJ24YV1ULmzMOkUSaddw+AvG0u4MzgKsM1CZWNambDOHfZIgFB2F6QDrrfhP2Ib5d5DjEm
	bLrJRa9S6D98AW2IC08r/Dz8R/SfcRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671450136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ch9cu30zdymbS4/mu8gbBsWUq8wgD46ogCiJ5XmHdE=;
	b=ZCSGGGJquF1Io6vrmyHyZfOedD40Fsf5m32bkCJWUoCPpB40iYq7kUSsXmL7UQBQSe2GLG
	rFmUh+eq5Q4j+JDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB87913910;
	Mon, 19 Dec 2022 11:42:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GaH0GxdOoGNaYQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 19 Dec 2022 11:42:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Claudio Fontana <cfontana@suse.de>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
In-Reply-To: <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
 <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
 <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de>
Date: Mon, 19 Dec 2022 08:42:13 -0300
Message-ID: <87r0wv8vsa.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: uCfRXx45oINs

Claudio Fontana <cfontana@suse.de> writes:

> Ciao Alex,
>
> On 12/19/22 11:47, Alexander Graf wrote:
>> Hey Claudio,
>> 
>> On 19.12.22 09:37, Claudio Fontana wrote:
>>>
>>> On 12/16/22 22:59, Alexander Graf wrote:
>>>> Hi Claudio,
>>>>
>>>> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific>
>>>> Alex
>>> Hi Alex, Fabiano, Peter and all,
>>>
>>> that was the plan but at the time of:
>>>
>>> https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/
>>>
>>> Peter mentioned that HVF AArch64 might use that code too:
>>>
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html
>>>
>>> so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".
>>>
>>> I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?
>> 
>> I originally reused the PSCI code in earlier versions of my hvf patch 
>> set, but then we realized that some functions like remote CPU reset are 
>> wired in a TCG specific view of the world with full target CPU register 
>> ownership. So if we want to actually share it, we'll need to abstract it 
>> up a level.
>> 
>> Hence I'd suggest to move it to a TCG directory for now and then later 
>> move it back into a generic helper if we want / need to. The code just 
>> simply isn't generic yet.
>> 
>> Or alternatively, you create a patch (set) to actually merge the 2 
>> implementations into a generic one again which then can live at a 
>> generic place :)
>> 
>> 
>> Alex
>
> Thanks for the clarification, I'll leave the choice up to Fabiano now, since he is working on the series currently :-)
>
> Ciao,
>
> Claudio

Hello, thank you all for the comments.

I like the idea of merging the two implementations. However, I won't get
to it anytime soon. There's still ~70 patches in the original series
that I need to understand, rebase and test, including the introduction
of the tcg directory.

I'd say we merge this as is now, since this patch has no
dependencies. Later when I introduce the tcg directory I can move the
code there along with the other tcg-only files. I'll take note to come
back to the PSCI code as well.
