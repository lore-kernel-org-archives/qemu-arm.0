Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3376632ejb;
        Mon, 19 Dec 2022 02:55:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5lxq7+0eEeO+Na/Y4rxYFcLgTM7by3PSCaUY37bsMZIdU+HlYvTktMEyxor10ZXERlgcQ3
X-Received: by 2002:a5d:414d:0:b0:242:864e:c71c with SMTP id c13-20020a5d414d000000b00242864ec71cmr27267120wrq.24.1671447306666;
        Mon, 19 Dec 2022 02:55:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671447306; cv=none;
        d=google.com; s=arc-20160816;
        b=EcZBwr16cVkQppaCQCmXa2y3LUxTJB6lCy+Lr7bmcTIUs8aiBKbRVLlXVpbjljut3f
         NxjN/gE+hEzjRBJJu4k6ACZu8Cq9F8tQqpwUX0EQC2VVR/dPe17zicrnHdFglduoAlgW
         ANZLLURBApkmHHims8nE5i7fRFuKjjPOaU49G3UwQ+P1t8UPRUgKib6cFD/xhQNRy1Gg
         hK9zb6NOg+e1rSJ2+ev8R5CMzhoDmDQMB2BJKsEFOqs+FpYI7bQW8G0ro45TRiEb6tJ0
         xavHU8QLJSlIImnfeADJXtE1+Uz1uv7LPIAVk0JIR/MZyk7GmNUXbq1mg1JK4R68JHOb
         ISeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=3WX1qfxHuBtVN5ICiqZGgGEWWWmT1q9Xj/Pe2oZDVZ4=;
        b=tyZkEmE+6WspUJSSUHZOV1Dx0NnepeZjxngSuheCntX8xnUFOyrBbFnIT6nGgDFcMP
         /dmwq+jfxlvMqpYrCy6qW8ulWJeycp/6cOyhxZI13ftNwJuqvBND2jt1Hp1ukttrANxa
         NSxmLeUJsukJ5etagNXf0ztJewS2j1DsCB8cGEee5fejqKwhmH78BOVBsxNb0vWKPkoD
         /B3IZi4glTQ42pobGFZeCXEMvPDgPA9Ujif6jhjya5aWzg4dCDCHiDpEnQWET10h9PMd
         SgsLe8fzK7/cQgid8pzslgtiTaNs+uol1NIy69AVa8c6ghxmfM0A4EE9wZGFbW+JSZBE
         Rt7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XZfrtLkT;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id n4-20020a056000170400b0025e07d45879si3418996wrc.630.2022.12.19.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 02:55:06 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XZfrtLkT;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 060B5352DB;
	Mon, 19 Dec 2022 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671447306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3WX1qfxHuBtVN5ICiqZGgGEWWWmT1q9Xj/Pe2oZDVZ4=;
	b=XZfrtLkTQgrqjgZNFiHsTRZvFGQgxCQHJLJR7ISx6AwEf8qFkCZrhmHZKh4905nYbzoSTQ
	XfhyQM4pbgXJGBcx47aUJTnlWofgdenLEixo/y86EEhIcoGLZOhD7/OHLpCR/tt4ELq4IE
	s5/t+fjchShTgH4cBs2TNRc8BPqQaZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671447306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3WX1qfxHuBtVN5ICiqZGgGEWWWmT1q9Xj/Pe2oZDVZ4=;
	b=acmKAfQZ8s5hS50l425mWNOe5+vaiAyqKnarimao8CA6a7MWZxvOp4LZezP1aqVH/XNFkv
	igDdthbcLx838zCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB20A13498;
	Mon, 19 Dec 2022 10:55:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DOlWLAlDoGN5RgAAMHmgww
	(envelope-from <cfontana@suse.de>); Mon, 19 Dec 2022 10:55:05 +0000
Message-ID: <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de>
Date: Mon, 19 Dec 2022 11:55:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
 <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 9RumbSSVnMtE

Ciao Alex,

On 12/19/22 11:47, Alexander Graf wrote:
> Hey Claudio,
> 
> On 19.12.22 09:37, Claudio Fontana wrote:
>>
>> On 12/16/22 22:59, Alexander Graf wrote:
>>> Hi Claudio,
>>>
>>> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific>
>>> Alex
>> Hi Alex, Fabiano, Peter and all,
>>
>> that was the plan but at the time of:
>>
>> https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/
>>
>> Peter mentioned that HVF AArch64 might use that code too:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html
>>
>> so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".
>>
>> I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?
> 
> I originally reused the PSCI code in earlier versions of my hvf patch 
> set, but then we realized that some functions like remote CPU reset are 
> wired in a TCG specific view of the world with full target CPU register 
> ownership. So if we want to actually share it, we'll need to abstract it 
> up a level.
> 
> Hence I'd suggest to move it to a TCG directory for now and then later 
> move it back into a generic helper if we want / need to. The code just 
> simply isn't generic yet.
> 
> Or alternatively, you create a patch (set) to actually merge the 2 
> implementations into a generic one again which then can live at a 
> generic place :)
> 
> 
> Alex

Thanks for the clarification, I'll leave the choice up to Fabiano now, since he is working on the series currently :-)

Ciao,

Claudio

