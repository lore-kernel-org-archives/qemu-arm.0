Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2790788njb;
        Mon, 9 Dec 2024 10:25:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWbtUoXp1WzyHyyGhH91FDFH6NgyVJ7Tf4PD+Vnb0Wu09KyMmrS+3QNN2SyMf0G9ua6wgMnMQYn3CdO5A==@linaro.org
X-Received: by 2002:a05:6a00:22d0:b0:727:3c37:d5fb with SMTP id d2e1a72fcca58-7273cb92441mr1839705b3a.16.1733768752527;
        Mon, 09 Dec 2024 10:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733768752; cv=none;
        d=google.com; s=arc-20240605;
        b=BrPE9NdN6Ny187gd/g11aTVGBYuafzm+/2J+b6BTfWLls38Ov5PZo1LQmDtM5eOAbt
         p03lFpb2N/pSSqmcl6tsHeowT719Ux1CsdC/m6wYTIqKi6a5/0ny09uodbl7pTj5sb4a
         PCvUgp9eRGJvXLHX0fDxks7+moIP2FRYv2Wr1bVvK9bbXLq4hdhT9sMgmgZP4mdRYybg
         KGyHSJJOco3KXpjf5gzfFo6MedtJXhVhx2XCn6Y9QOl5JMxwlQImGFjiDWlFgvibrFk/
         tIQcM23PLw94cKWXpaAyXvMONUUBo648PtrCRymQpucNPm3JtvXLrFoKd/mCtI2FvEqt
         zwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5sc/zlzqr4yLfdRPh4w1mTJtVEwOYGR3gVEEm/MVuu0=;
        fh=t33Jp041LrQE/mxWMepHSn83JlJBCj3HLrrBEJE2Vvo=;
        b=glo6AJrsHdIkc/XR/UJiGJ0pQvtWS/lHgwHTupkCTRH7D1n9DxCf8IkwIkvFyY9XOj
         Sr6yNoLTmPZWok8ky6gJVI5YYlnw1Rl+NAtEMpOciyclMr2uQ4uf8JoK8DlpY7la/8Jd
         ZLMrszTXPUV+syyAtN1jQzlRkDlDuxEa1fnt0UKdCnuoeP9hwyc8cOqIHQKrO/ecQJ1z
         iXPJrsMFboaZ2naEN1sU05k/M7MTycSHUdHGkFs/IC2ME5i50kIZVhp50GICnKsNshCE
         ZW856RJyI807Q6I1eCGRYOmSAypM07gOBXdIlGQ7AdehRsvAI0FxiqE6yknQnkZ9eNUN
         lZag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YthatlcE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-725f3e34a24sor1544442b3a.2.2024.12.09.10.25.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Dec 2024 10:25:52 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YthatlcE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733768752; x=1734373552; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sc/zlzqr4yLfdRPh4w1mTJtVEwOYGR3gVEEm/MVuu0=;
        b=YthatlcE1Ri+92p9Y6nrdpyTDfq/JlVqTne/xek8CHlS+xKQAHAg+qr8uOeHUke1MY
         YJNhUso8X5Jky7YaCUUvMq2gxGWZ846TLvBJUpDhVUWKHH+L2Tim4fp1kc1XTMNrAug0
         RWbMjCE3PGul2YqsJi4dXppESnm6rmneNNYrlk/g+vsn12ZKBqTr+acXF2Foodl7iz5m
         zLYGqvmp4EPjxnEp/YseHMvoN0PEc176hApjUxgxKY4LLLcSV6kHinxoSi9/pqwk5FNZ
         XiYTlZzsQzmfhopgN4Muo0152wuf8mvZuda+fzEWYC/+NKYxmFDLobq38BUjloI1QYIn
         UkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733768752; x=1734373552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5sc/zlzqr4yLfdRPh4w1mTJtVEwOYGR3gVEEm/MVuu0=;
        b=S0XU4ulOyWKf/yPJSgn0HKkaiIghT2AZaVDbU8MCPEL+kAqufHv6ihYnW0cayH+lQD
         ZwYhYd7YUcjh3wtRbkiF6f02iEcUBCelU+OOaMkmyV1SxaZ9dfswxZ1gfb7LEl8xSpRA
         tOGqMWIEME6RL39tb82ezxq7boHiVGzMrXl2ya4C6slUdYCDY0+k09v/qsrhZDB6NFQe
         eBSAqgRK5Q9VKsBQkLYBKfFPNM4d+OFbx0al+yGnQQH8BYURnKMzeHKfKqp4lng/wFZw
         b7JZC1blze6HbV2fWw7+Hi/Dueo8znyozdm2w7y8S1Gmz36Ayqr6vvmgbTzRZmNlSOaH
         xcPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVb9n5mPTMrUgBtqCQvEykj4VlOE+PNANrwr04JgPcndOxYnqzueU0ekCu7S6Uwl/kjaFJ4LcmJ0oyQg==@linaro.org
X-Gm-Message-State: AOJu0YzV37dgriJwEH14D/lHyYTbOyIDML5d43tRYcdggi2sYssRdlVF
	DHC96c10IZbOf89G98/8DcoZuBEU+GmBdNfKh8o0UQ2CyZ/21A+71Z8BGr44f0o77w==
X-Gm-Gg: ASbGnctfYkqGL3HxowfExXGmVlDeDrcMQ0/669J3vVYIxXkFZxqOrnvOR7AlOtH1HxG
	d4cXcvvqXWa8ZpxQSThJ/nS5a2DzJ/gPtDhSFNZuBOnIP52ucNL0u0vL9h7aGgM3bZQnmn7O2dg
	nFcv+qMU/T2lGQH7MMRE505XBg+i0cZHG/vvWImyBk28ZzjOJhh2NyuDzRxFrz103YlvNRVpVYc
	9G3EfFE7snDpb1dTldIMMwDz7VEq+Yy7rPoqprXxplzi0n+4aFiKIy355sN9TBwNADkoaPrtPAm
	CRpNHtInlsSvl/IQSs821IjCMA==
X-Google-Smtp-Source: AGHT+IGtzqsCPU6jEkieD7TImWgDFXGHxos/m9EMy/BwHyTvUj+KviItTSKuNWYAQSTT/PPY59iRRQ==
X-Received: by 2002:a05:6a00:22d0:b0:727:3c37:d5fb with SMTP id d2e1a72fcca58-7273cb92441mr1839672b3a.16.1733768752020;
        Mon, 09 Dec 2024 10:25:52 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd578b457csm742249a12.27.2024.12.09.10.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 10:25:51 -0800 (PST)
Message-ID: <ea22699b-28bb-4bb0-8d5e-a0608b6e4beb@linaro.org>
Date: Mon, 9 Dec 2024 10:25:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] docs/devel: add b4 for patch retrieval
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Peter Xu <peterx@redhat.com>,
 gustavo.romero@linaro.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Eric Blake <eblake@redhat.com>, Andrew Melnychenko <andrew@daynix.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Jason Wang <jasowang@redhat.com>, manos.pitsidianakis@linaro.org
References: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
 <20241206192900.3893118-4-pierrick.bouvier@linaro.org>
 <2f99cd24-768a-4e28-b5b4-d2697ca244af@redhat.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <2f99cd24-768a-4e28-b5b4-d2697ca244af@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: SpmUvqQIkIuY

On 12/8/24 22:47, Thomas Huth wrote:
> On 06/12/2024 20.28, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    docs/devel/submitting-a-patch.rst | 10 ++++++++++
>>    1 file changed, 10 insertions(+)
>>
>> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
>> index 69df7682c5e..1ef7d137320 100644
>> --- a/docs/devel/submitting-a-patch.rst
>> +++ b/docs/devel/submitting-a-patch.rst
>> @@ -433,6 +433,16 @@ For more details on how QEMU's stable process works, refer to the
>>    
>>    .. _participating_in_code_review:
>>    
>> +Retrieve an existing series
>> +---------------------------
>> +
>> +If you want to apply an existing series on top of your tree, you can simply use
>> +`b4 <https://github.com/mricon/b4>`__.
>> +
>> +::
>> +
>> +    b4 shazam $msg-id
> 
> Should we elaborate on $msg-id here? (saying that this is about patch series
> that have been sent to the mailing list and you have the retrieve the
> "Message-Id:" header from one of the patches?)
>

Ok, doing this is next version.

> Apart from that the patch looks fine to me, thanks for tackling this!
> 
>    Thomas
> 
