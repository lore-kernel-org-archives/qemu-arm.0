Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1143939wrq;
        Sat, 9 Feb 2019 19:44:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYpuM37azjNMpJv6ICvxrwSznwyd70Cb7aICyxkt5WVwe+XLawpokk8EVM1GjUOzvYiY574
X-Received: by 2002:a1c:9ad4:: with SMTP id c203mr93140wme.69.1549770281151;
        Sat, 09 Feb 2019 19:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549770281; cv=none;
        d=google.com; s=arc-20160816;
        b=y4NxWTQiEpRj+PTPH15r21jaOtMYrGrY9628aV08l+vYZ/YlrDAi7ZiExvcGPnewKk
         ppTKoPtHgzzPuG0gB3qGu23FxpIymmwqH2RevCd/0aOnqKtFWeL7govnuuBUxLuWfdqN
         FKssQ5ZA4RO2GzgS40sHPsxumNP8CleUPN1df0H2NV5iOXXRYQGeFAl9ioe3grxRp6yY
         tImoIATOPIPmoIOU89yWdsSnAbi+M4Sd0hN63yDQzOm3KrXjk4Trrm1d1UFyAax8kbr+
         m9keZwAaxHGui/GfQFEHDa7rjqqAOQW3wc1tR/ZUTOInAIlByLf+W8CoZ/XVzDP8h9Xp
         1emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=H+fao152WSydIJkt/H7ckIcK5+A3/X+OcB8SK6Eo3SI=;
        b=dbVa4kxYtURqFKoKkHnHQpUNHqW7pcF1H0arn/thdKlcVp3r4DC+eZEIshUxGcXR6X
         zmjIdZphUnGE6B9dtT4reJ+UhpJvNvVLykBRZaK74RdZBYbspJMjkHJnlIi4+8quVR1g
         nNBDUARf5+yOdbzixgiIHLTrwp2o3NO+WCb2SnWR2yfZ8KnI/BmqJQSKBu0c5R+U6Axw
         ye/GcFv0uZIVEQG1PLa98xf5K0vSmWRN+D+1Q8Niyxr7NkwT+LYzTiEJuVpvyMI03K3r
         PjWcgPJNuZACAV/Rv7m8X5Eh//DMse1Hf1f6tPNfChb5FnauGSsWbIU8clJkuuBAVz18
         2HCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ExO9kWUO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f85si5130368wmf.78.2019.02.09.19.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Feb 2019 19:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ExO9kWUO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsg2p-0006v2-Gm
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 22:44:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gsg1q-0006Yq-BC
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 22:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gsg1k-000540-Lp
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 22:43:36 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39679)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gsg1d-0004zN-H1
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 22:43:28 -0500
Received: by mail-pf1-x441.google.com with SMTP id f132so3589310pfa.6
	for <qemu-devel@nongnu.org>; Sat, 09 Feb 2019 19:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=H+fao152WSydIJkt/H7ckIcK5+A3/X+OcB8SK6Eo3SI=;
	b=ExO9kWUOf95pcRmkspa6M5p73Nb4Tsvq1JjIbFXl7fB6IDG/s1d9L82pvkw344mmKG
	5/38/3OLDTQ3K+cCzU5GGTiU8sAoBOBy7PvAsdVUYyircLpLM/AOnqwul8yTCV23hUde
	h5nF/bHLnIN8dsPPPC6NHzyNBACs3LTy1khkp+idRFEfmqJelXfoh5zL4oc2s8aEigjq
	g07a5uZD3u2iGP3GqMlUXsJYVS3x0eEyjQFshyl0vU3kj9XKNUm+Nuc9QBfADLZRVUoX
	CAKCIKYuOwphi7SUGoqaM1ArwGirOMw0KJkfjgzk6kDkJux1/V7d4+DynAhKNe61BjCP
	ySFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=H+fao152WSydIJkt/H7ckIcK5+A3/X+OcB8SK6Eo3SI=;
	b=AzIvL2MhBdzWqik1hgTEomlcpT9WxfyYe2k9dFClCqy8EXldtUhDYmUVwVBmdcIfb7
	izkME8YfAUy2HoG67Tb2zLZIJmxMIkSZjtmsEjeUj+LzSueEBePZpWzOukLCeqSnbOXM
	xDuISAXE0PjgnMCxGsAz5T8mdOdX8gp+hhoQGlGC8IxkUkrwOoAFIbdBaWnTzga/HroD
	M58711l8eLr+rHutR4tFTt2mWpLQb/SoQbYBzB3qaW00GhJxX24cokf+mzCwPcYUlips
	fC9wYlKQBPToz3so/N956RsbR4yni7XeqMp7/MIZW8DjVD1dlHKbBvgifb3JInrXnPTB
	jhsw==
X-Gm-Message-State: AHQUAuZROXJ5mtLqOwg6lopvjuVLjXZZ1a1mXdCOKFISOUmgzJQCAVbh
	FVHiUnoaBCh4ikiBPqQzc8LyXg==
X-Received: by 2002:a63:134a:: with SMTP id 10mr26096832pgt.83.1549770201007; 
	Sat, 09 Feb 2019 19:43:21 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g136sm10505097pfb.154.2019.02.09.19.43.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 19:43:19 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-7-richard.henderson@linaro.org>
	<CAFEAcA9Kcd6a1Af4ChbOH55XRVWfpeCAexJwxH5AwP8Kn_U0+g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <22287812-8733-ce2e-f6f0-7d1f4a2bb304@linaro.org>
Date: Sat, 9 Feb 2019 19:43:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Kcd6a1Af4ChbOH55XRVWfpeCAexJwxH5AwP8Kn_U0+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 06/17] target/arm: Implement the IRG
 instruction
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PW1gvaPQJqRL

On 2/7/19 8:47 AM, Peter Maydell wrote:
> On Mon, 14 Jan 2019 at 01:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper-a64.h    |  1 +
>>  target/arm/mte_helper.c    | 55 ++++++++++++++++++++++++++++++++++++++
>>  target/arm/translate-a64.c |  7 +++++
>>  3 files changed, 63 insertions(+)
>>
>> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
>> index fa4c371a47..7a6051fdab 100644
>> --- a/target/arm/helper-a64.h
>> +++ b/target/arm/helper-a64.h
>> @@ -104,3 +104,4 @@ DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
>>  DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
>>
>>  DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
>> +DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
>> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
>> index 6f4bc0aa04..1878393fc4 100644
>> --- a/target/arm/mte_helper.c
>> +++ b/target/arm/mte_helper.c
>> @@ -36,6 +36,48 @@ static int allocation_tag_from_addr(uint64_t ptr)
>>      return (extract64(ptr, 56, 4) + extract64(ptr, 55, 1)) & 15;
>>  }
>>
>> +/* Like ChooseNonExcludedTag, except that GCR_EL1 is already in.  */
> 
> I don't understand this comment -- neither the pseudocode
> function nor this code refer to GCR_EL1.

That's changed since the first rev.  Now ChooseNonExcludedTag just has an
exclude argument, and the caller includes GCR_EL1.Exclude.

>> +static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
>> +{
>> +    if (exclude != 0xffff) {
>> +        int i;
>> +        for (i = 0; i < offset; ++i) {
>> +            do {
>> +                tag = (tag + 1) & 15;
>> +            } while (exclude & (1 << tag));
>> +        }
>> +    }
>> +    return tag;
> 
> This doesn't seem to do the same thing as ChooseNonExcludedTag()
> for the offset==0 case, or for the exclude == 0xffff case.

All of this has changed since the first rev too.

> This comment is trying to say that our IMPDEF choice for GCR_EL1.RRND==1
> is "behave the same as if RRND==0", right? I think that would be
> clearer as a comment at the callsite, because if you're following
> along with the pseudocode you expect the IRG code to do an
> "if RRND == 1 then { choose_random_nonexcluded_tag(); } else { ... }".

Thanks for the verbage.


r~
