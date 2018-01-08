Received: by 10.28.173.206 with SMTP id w197csp3000665wme;
        Mon, 8 Jan 2018 14:36:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBovwEyvwL1wszrP94YwnKZgnUOiS+daLNY3EyKR206gnZzaxkQ4qHNu0eThnR5nU4+p0zxpG
X-Received: by 10.37.3.214 with SMTP id 205mr10953846ybd.272.1515450990673;
        Mon, 08 Jan 2018 14:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515450990; cv=none;
        d=google.com; s=arc-20160816;
        b=M+YDq1Dfp00FgOG7KT8Xj0Oc+M/qSkmdAgQWvrqb06b+wR6uHq8z0m7yIzNv0sS62Z
         Ede/AD+/egmCjO1/PiiNGNP6BPNTUlN7NHN3CoF4sR+iUsv2bZ9O8HQi0KHZiEJ9aUNi
         TSx6IcNiodp98UEiiZHeFOG/bqb3Tx7Bq8rm6p6uPUoPD+d9lm6FGKyTwkTvPocbHDEk
         tsrDRMw4LotvoKsAUG1TScnLV8k/bbrtQ28XaFjzdY5Slqsub9sOFcayPA7fGP4IAVip
         9XMxlQkSOaWR9x9dQxcV1rrpS44b73p5VVOHt4dxFYdA9/52V+TfQMMgt+hGqj/E5qgh
         tPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=6h1yhM8ATNSMBNDo/HP/79u73eR8HT1Qy3jvhDbJrEA=;
        b=m/5nhLb69QjJABwnPj/P32XRSSCFKSn0NyH70Gs+/NTrmRYARyV7laeDmIODiOks9y
         tpV4TABDwIjD2uAE+sA0cbu9EcBl1iNFa7IebgvJ43u8VtGhgVOKUc27yJmQ7PdUk3C6
         7bPjMfYdiDE25K5caWXHljIoTgpG07SLVjwCN88zpz8UvCrav+V6StLQU5szy0hImQgK
         Z4A/Q0eeDMvaNh4zeuNLVZ7wHcDNwgdNoSbhop7SEaNEOPjzKmwmay6ae4vbvAFnFbfV
         c/rTcK6wcr3MVXF7VgmmRL3KcRD46eHB9JxiPb9JGngfyX/HMfKjTtg9AwRvfZcGqYgR
         c3yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hWH642Qn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10si82492ywb.240.2018.01.08.14.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 14:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hWH642Qn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYg1u-0003Qg-6Z
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 17:36:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYg1F-00034W-Cd
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 17:35:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYg1A-0007ri-CI
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 17:35:49 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38545)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYg1A-0007rD-3m; Mon, 08 Jan 2018 17:35:44 -0500
Received: by mail-qt0-x242.google.com with SMTP id d4so15607026qtj.5;
	Mon, 08 Jan 2018 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6h1yhM8ATNSMBNDo/HP/79u73eR8HT1Qy3jvhDbJrEA=;
	b=hWH642QnzTjGDzZ3oljxmfwlYxKG9k6w894mR/8MS113fwCSnRQ8whiMGKi947RBa/
	0Mk//4Pt/RW3AHDHYrvNsKWV2sROMDTb9t/+FAcD3lZj/y/v0+GmDpq9k0Hqoenhm5jE
	me6CXXuDo7IEgOw6ho46iki+/THCjUfnwlEQi840W0Qak/3QwODN+0gH5z9tEoBkSYDB
	qKrMB7cfqUymsOCvVV845DH7F0YfCoya5XLCKAshc6rpGVDe58MRBZYB0Y0IbsK+pkng
	A/U+JsPXSLtRcaoBiNSCl+Qn8TPfZtv8nfvRy1jq/fcSwzX7C0SHmBMnb2lO41VYiGzT
	xwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=6h1yhM8ATNSMBNDo/HP/79u73eR8HT1Qy3jvhDbJrEA=;
	b=hnR/ZiT4YT2seystVCdxNoLXFmNBgy5Og9grsUPweQryVwqJsLoZWZv9u7oVIhayAU
	x0gxI+A793L1r1fwStxN3y3iz6bPmfNpe3VYZ8G3sRD0sOZK/8n0gDZapUo+6fhhn1ga
	Gfu85bBVwmm18e0bcafPIKsIB1/pzUh8QLbAORiRiZE2Sc/3WRKC5TD4aOgqwwMyLDZI
	wfbFy0bU3WSNCS4HJZSCIR/9yx2U3DvKVUMz2Pro+sko4flE0+CPeh14ZctYIk0EJlVX
	v/KFAjemolZbpxlL1FcL45fAdIHpzBmtaX0DTM+/gGTJyEM6EeavphX0FW2tz4izg1Kj
	H/yQ==
X-Gm-Message-State: AKwxytfx7HEA3TufiwEutGZm+uPJPgobRkaZHj/uSGJv4ID5jGbnYPfl
	TD0B5TA/VuoMNYcgyd3Y3PA=
X-Received: by 10.200.55.51 with SMTP id o48mr19578452qtb.41.1515450943462;
	Mon, 08 Jan 2018 14:35:43 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	z65sm8771303qkz.33.2018.01.08.14.35.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 14:35:42 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-5-f4bug@amsat.org>
	<CAKmqyKMbf9RxyfqE2s1fvcUGp+t-Ywdwjx5CEQvKO_Pe9HnEFw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <048699f3-ca67-8b7c-6b5d-940c6349db78@amsat.org>
Date: Mon, 8 Jan 2018 19:35:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMbf9RxyfqE2s1fvcUGp+t-Ywdwjx5CEQvKO_Pe9HnEFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 04/31] sdhci: add clock
 capabilities (Spec v1)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=c3=a9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJXBQh28oI0Y

On 01/08/2018 07:22 PM, Alistair Francis wrote:
> On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/sd/sdhci.h |  2 ++
>>  hw/sd/sdhci.c         | 52 +++++++++++++++++++++++++++++++--------------------
>>  2 files changed, 34 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
>> index 2703da1d5a..c1602becd2 100644
>> --- a/include/hw/sd/sdhci.h
>> +++ b/include/hw/sd/sdhci.h
>> @@ -103,6 +103,8 @@ typedef struct SDHCIState {
>>      bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
>>      uint8_t spec_version;
>>      struct {
>> +        uint8_t timeout_clk_freq, base_clk_freq_mhz;
>> +        bool timeout_clk_in_mhz;
>>          uint16_t max_blk_len;
>>          bool suspend;
>>          bool high_speed;
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index c78643fe54..05681c86d6 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -46,36 +46,31 @@
>>  #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Support */
>>  #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
>>  #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
>> -/* Maximum clock frequency for SDclock in MHz
>> - * value in range 10-63 MHz, 0 - not defined */
>> -#define SDHC_CAPAB_BASECLKFREQ    52ul
>> -#define SDHC_CAPAB_TOUNIT         1ul  /* Timeout clock unit 0 - kHz, 1 - MHz */
>> -/* Timeout clock frequency 1-63, 0 - not defined */
>> -#define SDHC_CAPAB_TOCLKFREQ      52ul
>>
>>  /* Now check all parameters and calculate CAPABILITIES REGISTER value */
>> -#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1 || \
>> -    SDHC_CAPAB_TOUNIT > 1
>> +#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1
>>  #error Capabilities features can have value 0 or 1 only!
>>  #endif
>>
>> -#if (SDHC_CAPAB_BASECLKFREQ > 0 && SDHC_CAPAB_BASECLKFREQ < 10) || \
>> -    SDHC_CAPAB_BASECLKFREQ > 63
>> -#error SDclock frequency can have value in range 0, 10-63 only!
>> -#endif
>> -
>> -#if SDHC_CAPAB_TOCLKFREQ > 63
>> -#error Timeout clock frequency can have value in range 0-63 only!
>> -#endif
>> -
>>  #define SDHC_CAPAB_REG_DEFAULT                                 \
>>     ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
>> -    (SDHC_CAPAB_ADMA2 << 19) |                                 \
>> -    (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
>> -    (SDHC_CAPAB_TOCLKFREQ))
>> +    (SDHC_CAPAB_ADMA2 << 19))
>>
>>  #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
>>
>> +static void sdhci_check_capab_freq_range(SDHCIState *s, const char *desc,
>> +                                         uint8_t freq, Error **errp)
>> +{
>> +    switch (freq) {
>> +    case 0:
>> +    case 10 ... 63:
>> +        break;
> 
> You are missing a default here.

Thanks, peer review is useful :)

I didn't try qtest expected failures yet, I'll see if it's doable.

> 
> Alistair
> 
>> +        error_setg(errp, "SD %s clock frequency can have value"
>> +                   "in range 0-63 only", desc);
>> +        return;
>> +    }
>> +}
>> +
>>  static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>>  {
>>      uint64_t capareg = 0;
>> @@ -83,6 +78,16 @@ static void sdhci_init_capareg(SDHCIState *s, Error **errp)
>>
>>      switch (s->spec_version) {
>>      case 1:
>> +        sdhci_check_capab_freq_range(s, "Timeout", s->cap.timeout_clk_freq,
>> +                                     errp);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, TOCLKFREQ,
>> +                             s->cap.timeout_clk_freq);
>> +        sdhci_check_capab_freq_range(s, "Base", s->cap.base_clk_freq_mhz, errp);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, BASECLKFREQ,
>> +                             s->cap.base_clk_freq_mhz);
>> +        capareg = FIELD_DP64(capareg, SDHC_CAPAB, TOUNIT,
>> +                             s->cap.timeout_clk_in_mhz);
>> +
>>          val = ctz32(s->cap.max_blk_len >> 9);
>>          if (val >= 0b11) {
>>              error_setg(errp, "block size can be 512, 1024 or 2048 only");
>> @@ -1304,6 +1309,13 @@ const VMStateDescription sdhci_vmstate = {
>>  static Property sdhci_properties[] = {
>>      DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
>>
>> +    /* Timeout clock frequency 1-63, 0 - not defined */
>> +    DEFINE_PROP_UINT8("timeout-freq", SDHCIState, cap.timeout_clk_freq, 0),
>> +    /* Timeout clock unit 0 - kHz, 1 - MHz */
>> +    DEFINE_PROP_BOOL("freq-in-mhz", SDHCIState, cap.timeout_clk_in_mhz, true),
>> +    /* Maximum base clock frequency for SD clock in MHz (range 10-63 MHz, 0) */
>> +    DEFINE_PROP_UINT8("max-frequency", SDHCIState, cap.base_clk_freq_mhz, 0),
>> +
>>      /* Maximum host controller R/W buffers size
>>       * Possible values: 512, 1024, 2048 bytes */
>>      DEFINE_PROP_UINT16("max-block-length", SDHCIState, cap.max_blk_len, 512),
>> --
>> 2.15.1
>>
>>
