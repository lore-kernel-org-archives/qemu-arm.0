Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2411470ejc;
        Mon, 9 Jan 2023 08:42:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskxLYjijgW+LvL0C2Xrmgn+ZAyMESVc21Jis90ilcLzcMtq+If8RGtpmXtKr3g7NXPqMoB
X-Received: by 2002:adf:dc0f:0:b0:242:4f41:4dae with SMTP id t15-20020adfdc0f000000b002424f414daemr40565138wri.71.1673282563288;
        Mon, 09 Jan 2023 08:42:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673282563; cv=none;
        d=google.com; s=arc-20160816;
        b=wj40C5hQjHWOwgRtEkUhvWSGb8cL8RuVw7XegtLJ9UDg2CdoLnItAFpbN99/zekoN3
         ZLoXXxtDWF/P5E1V74Wcv34dvqGVbDQngOVkNS8lE9YCxWcatKv7LzhlxqZiJVJ63Uv8
         9pfMpnvHfa5gPVXWBtN5QndTlqq2mzbleL7D3sUrU6hNY9NtxngxNSCTVGAxt26yAS2w
         e5Fc8WX+ygSUdDBZXIT+ij4G5njNYHcrp1MQIWp+uHS1mWXhYusqTHoSFmsAxeYjp6bM
         hZd6mdnpMCbBXSJQCaHNZ0toqEWNN278/2XG4FYKDGFYIpETjq0IyxMTQMq4JxzCbXX9
         jjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=VdI81UaCvhNm3g/O2k1hG7XmGPh04uIBAka7+j2jxQE=;
        b=jO44OteyOVYBCJi+lkgZU0ub45qAotvNKcnm1WPTN+wD9aaXRT09NUHgHMaY0kVsO9
         zF9j6q1O7EvpwNehznHxhi+6YfK0HexAmgigJBG29kqHfPRXqQZ0QxJULQrfGn7vWKPu
         KKvOxM6hTwTyiY8FngDobhMp4deshRPpnGtokl8Crt1p12dhXLRkSO1dStZsqw4hT6yp
         drZqjcPr7pAl7SgwHbZ4s4g2tECsVOIbXws6bq2/fGCKVQq1zLKmV6QDxUYv8xkkFLvZ
         V9mQyDZ6xwiP0PK6NtmK8k5BvTeQFPG0vOdfOQ6BJjiKW/5AGOtWXocCU678EKwZcWp7
         XL3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=KBGjQCnv;
       dkim=neutral (no key) header.i=@suse.de header.b=q+fVyjd8;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id i10-20020a0560001aca00b00268ca155067si8480518wry.418.2023.01.09.08.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:42:43 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=KBGjQCnv;
       dkim=neutral (no key) header.i=@suse.de header.b=q+fVyjd8;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1E3181FD93;
	Mon,  9 Jan 2023 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673282562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdI81UaCvhNm3g/O2k1hG7XmGPh04uIBAka7+j2jxQE=;
	b=KBGjQCnvnGx0hKJLsijAG7sthUuoDST4Imx/DxoNrBvF+qXcmSGM/OYinJtkHpJPUowZ2T
	kSRNXyqbRcMHpeRxOZ2R5MQajVPvfIFq/BRhi4va1RHak+zAJXDslVd7WWF5d/MrH4430Y
	vYYs2yrEoZnE5RMPs73/m/HAqufP3Jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673282562;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdI81UaCvhNm3g/O2k1hG7XmGPh04uIBAka7+j2jxQE=;
	b=q+fVyjd8cMevDxmAY+ycn+Sd/CS9cHgI0eIrDrP9ofPgwE8UiN/ervzGlCIO6FI5ObK4FW
	yXNcvVRqKlB8iTDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EEFF13583;
	Mon,  9 Jan 2023 16:42:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XovWFAFEvGPMewAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 16:42:41 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Cleber Rosa
 <crosa@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [PATCH] tests/avocado: add machine:none tag to version.py
In-Reply-To: <2a1d1243-2675-8be8-c35f-8c072065645e@linaro.org>
References: <20221215224725.3236-1-farosas@suse.de>
 <2a1d1243-2675-8be8-c35f-8c072065645e@linaro.org>
Date: Mon, 09 Jan 2023 13:42:38 -0300
Message-ID: <87pmbnpsld.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: OIwGgaOBmFse

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 15/12/22 23:47, Fabiano Rosas wrote:
>> This test currently fails when run on a host for which the QEMU target
>> has no default machine set:
>>=20
>> ERROR| Output: qemu-system-aarch64: No machine specified, and there is
>> no default
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/avocado/version.py | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>> diff --git a/tests/avocado/version.py b/tests/avocado/version.py
>> index ded7f039c1..dd775955eb 100644
>> --- a/tests/avocado/version.py
>> +++ b/tests/avocado/version.py
>> @@ -15,6 +15,7 @@
>>   class Version(QemuSystemTest):
>>       """
>>       :avocado: tags=3Dquick
>> +    :avocado: tags=3Dmachine:none
>>       """
>>       def test_qmp_human_info_version(self):
>>           self.vm.add_args('-nodefaults')
>
> Looking at previous attempt in=20
> https://lore.kernel.org/qemu-devel/20220104122104.849084-1-alex.bennee@li=
naro.org/
>
> * tests/avocado/empty_cpu_model.py
>
>    Forced via vm.add_args('-machine', 'none')
>
>    tags=3Dmachine:none would be cleaner.
>
> * tests/avocado/info_usernet.py and
> * tests/avocado/vnc.py
>
>    -> Fixed by 5104b73824 ("tests/avocado: set -machine none
>    for userfwd and vnc tests")
>
> * tests/avocado/version.py
>
>    -> This patch
>
> * tests/avocado/migration.py
>
>    =3D> Missing

I think the migration test is a bit harder because the machine type
would probably influnce the test. We would have to find a way to
specificy the different -machine options for each architecture. Or a way
of saying "use default machine, except for arm".

>
> Maybe we can squash to this patch?
>
> Meanwhile:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks
