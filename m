Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CADCAC5B5
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 06:35:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v37Sz-0001nn-OU; Mon, 29 Sep 2025 02:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v37Sw-0001nK-Tu
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 02:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v37Sm-000696-JH
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 02:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759127649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mEj197Bbo5bAwyD22bJIxeo5gcg1p0+GmpRDS+3QxAA=;
 b=JFBYUIuHgQO/6jtTV1806AvZIp0Ba9rmh3JTxoWfKa502iwly9UmkOQlt2N/JNX1xw+YsT
 NTWy4y0psRmTHvuOenYsbgNM/eePXv41j8Xl+7ylvSAylZluBxVM2OYygL+9STpH+jY9zg
 5sr0rxh6GrOgNb0AjIBSythpDtvy0Hc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-7Qra1IjTNXaTuzUR98hemA-1; Mon, 29 Sep 2025 02:34:07 -0400
X-MC-Unique: 7Qra1IjTNXaTuzUR98hemA-1
X-Mimecast-MFC-AGG-ID: 7Qra1IjTNXaTuzUR98hemA_1759127645
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b2ef8e0133fso313240866b.0
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 23:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759127645; x=1759732445;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mEj197Bbo5bAwyD22bJIxeo5gcg1p0+GmpRDS+3QxAA=;
 b=T1/Ol2o2agukNcKise+d0ZMivh25lg+ETGJ1+uqPOE7ESerkC0lOjGbboW1SycazOx
 D2m3WcS9Jub2Ta1L3yk+D4SMG717m3pWduV/4/aVnc8FXe51Vcj/gmNaqpFUSRnl9dGX
 jgeqt5w8yiHWU8rHjHCQUAONM56cMKwMVJUMJ1q34z0mDXJT3nMVicOBxjp9eD7UyHKh
 suznSO8aohoOovhqkGo01Sxi19W/WBtwRYaNRgqzuaDesZR9u4K/WXOFACk/8203l6WP
 RKIT4RORxjiZ4QeMmdo9bEaM1EIEfvvj81NXO6oswxjbUHZEoipv06BWQth4q/cYqweR
 eq/g==
X-Gm-Message-State: AOJu0YzDXczJLBj3t6elCIXNZ7J5ZLFfSUs4RxDS5pLwPyz2KlE+m+Hs
 QnQE6izThz124aFkEVyj08Cq9RHCRSvKSlM7/I1RjqobMq4j0BlltYmVuDNLfNjiGpHAwb8fc5V
 Mh8tHrfllFI9i5W2BXVA95fy8OYeiMS8f4xW18nP1WLpFsm7ntbz/Nw==
X-Gm-Gg: ASbGncsbh7xZtOFDLSH5LhfznHLuGxrv+mNMF+hsBGKnnRxtMYdn1tXlR/5/vOEc+J7
 SjfnED3waWsSLahl1mygwyjd5Ef01/97fSg38FTZhdmhpmhHexapQrocJc9D7oey8l/O+Xnc+bF
 xMcVlBKxyPX2scaHn6lFCO7vDe9aENd3J5zgNLMh0JvmYODH17AcFPmADIsubEhkaYGq2Mmk17j
 89FmxyY6t79dYTJJJRoQZI+DiIzGvgQpzFqNxbZ2Jgiv65OdoIDLrtNStmE3BDJxlFUcnZMO3yy
 kREPV4X3jf338dsG/5wFERbh4TcHs3Krf20YnKCfbzMVzhnk6hT7u+bJ8MsXS7BFzweKHahRznY
 6E4i5RQ==
X-Received: by 2002:a17:907:9803:b0:b32:2b60:ee8 with SMTP id
 a640c23a62f3a-b34b7dc84dbmr1513953066b.15.1759127645231; 
 Sun, 28 Sep 2025 23:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDyPQouKYIF3sGE5XFhBn5UN5G80MiPPs1Sqc4fczjM6Od0Ay6CjH3lY57l9rwNDQPCGt4tQ==
X-Received: by 2002:a17:907:9803:b0:b32:2b60:ee8 with SMTP id
 a640c23a62f3a-b34b7dc84dbmr1513950166b.15.1759127644778; 
 Sun, 28 Sep 2025 23:34:04 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-212.pools.arcor-ip.net.
 [47.64.114.212]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3d0d74888asm244218966b.109.2025.09.28.23.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Sep 2025 23:34:04 -0700 (PDT)
Message-ID: <acad2462-9c7a-43e9-a40c-6c3d625684c8@redhat.com>
Date: Mon, 29 Sep 2025 08:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] tests/functional: Provide GDB to the functional
 tests
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <20250926051542.104432-4-gustavo.romero@linaro.org>
 <a9118adc-f9ac-4df0-8e60-4407945a5908@redhat.com>
 <bd906237-c0fb-4921-a017-a591bc95f31f@linaro.org>
 <599cd42e-0619-4556-ae70-b2d360e6405a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <599cd42e-0619-4556-ae70-b2d360e6405a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -ObR-4T9y794jlYR8W8XWLnBEZYRz7Fmu1clWgzLyAs_1759127645
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/09/2025 20.15, Gustavo Romero wrote:
> Hi Thomas,
> 
> On 9/26/25 15:08, Gustavo Romero wrote:
>> Hi Thomas,
>>
>> On 9/26/25 07:03, Thomas Huth wrote:
>>> On 26/09/2025 07.15, Gustavo Romero wrote:
>>>> The probe of GDB is done in 'configure' and the full path is passed to
>>>> meson.build via the -Dgdb=option.
>>>>
>>>> Because a single functional test can cover different arches, such as
>>>> aarch64, ppc64, and x86_64, only a GDB that supports all the arches in
>>>> the target list is passed to Meson for use in the functional tests. To
>>>> handle this check, a new shell function, is_target_arch_in_arch_list, is
>>>> introduced in 'configure'.
>>>>
>>>> Meson then can pass the location of GDB to the test via an environment
>>>> variable: QEMU_TEST_GDB.
>>>>
>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   configure                     | 21 +++++++++++++++++++++
>>>>   meson_options.txt             |  2 ++
>>>>   scripts/meson-buildoptions.sh |  2 ++
>>>>   tests/functional/meson.build  |  6 ++++++
>>>>   4 files changed, 31 insertions(+)
>>>>
>>>> diff --git a/configure b/configure
>>>> index 0f7eb95586..20e05d233f 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -1142,12 +1142,31 @@ fi
>>>>   #########################################
>>>>   # gdb test
>>>> +# Check if all target arches are in a provided list of arches.
>>>> +is_target_arch_in_arch_list() {
>>>> +    arch_list=$1
>>>> +    for target in $target_list; do
>>>> +        arch=${target%%-*}
>>>> +        if test "${arch_list#*$arch}" = "$arch_list"; then
>>>> +            # Target arch not in arch list
>>>> +            return 1
>>>> +        fi
>>>> +    done
>>>> +    return 0
>>>> +}
>>>> +
>>>>   if test -n "$gdb_bin"; then
>>>>       gdb_version_string=$($gdb_bin --version | head -n 1)
>>>>       # Extract last field in the version string
>>>>       gdb_version=${gdb_version_string##* }
>>>>       if version_ge $gdb_version 9.1; then
>>>>           gdb_arches=$($python "$source_path/scripts/probe-gdb- 
>>>> support.py" $gdb_bin)
>>>> +
>>>> +    if is_target_arch_in_arch_list "$gdb_arches"; then
>>>
>>> No TABs, please!
>>>
>>>> +            gdb_multiarch="yes"
>>>> +        else
>>>> +            gdb_multiarch=""
>>>> +    fi
>>>
>>> This unfortunately does not work with the GDB from Fedora - it only 
>>> supports "arch64_be arm riscv64 riscv32 ppc i386 s390x ppc64 aarch64 
>>> ppc64le x86_64", but if you configured a target like "alpha-softmmu", 
>>> this breaks.
>>
>> argh! ok
>>
>>
>>> (BTW, does the gdb-multiarch from Debian/Ubuntu really also support 
>>> exotic QEMU targets like tricore?)
>>
>> No, I've checked GDB upstream and I can't see any trace of tricore.
>> And I just saw that Alex left a comment in scripts/probe-gdb-support.py
>> saying "# no tricore in upstream gdb", so nope, it seems that it still holds.
>>
>>
>>> I think it would be better to drop this hunk, and rather check in the 
>>> spot where we use GDB if the required target is really there (i.e. in the 
>>> functional test that uses it).
>>
>> OK. I'm also not a big fan of doing it in bash. How do you suggest
>> to do it? Directly in the code, via a skipIf decorator, or something else?
> 
> $gdb_arches, obtained using scripts/probe-gdb-support.py in configure,
> could be passed to meson and meson sets it in the test env, as we're
> doing for $gdb_bin and QEMU_TEST_GDB env var. wdyt?

That might be a possibility, though it's getting a little bit clunky if you 
want to run the test manually, without the meson test runner.

Maybe it would be nicer to just start gdb in the test and catch the error 
(and skip the test in that case) in the python test code if it fails to set 
the target architecture there?

  Thomas


