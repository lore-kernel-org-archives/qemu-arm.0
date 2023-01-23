Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2972748ejc;
        Mon, 23 Jan 2023 06:39:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuf0fYmZD89IxE54c5cZxzO5nYTngl/hL0YbfmRCCQ9ERAK1W/0y3T2iPQj6Kn0wlo+Nhkn
X-Received: by 2002:a05:6214:440c:b0:531:9fb7:979 with SMTP id oj12-20020a056214440c00b005319fb70979mr36399920qvb.27.1674484793293;
        Mon, 23 Jan 2023 06:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674484793; cv=none;
        d=google.com; s=arc-20160816;
        b=BpOAxoycHnKkidQzxVtMWJFR2D1Hl4r5OoM1PXHolioGLYvrInLQfZrXhNtHUFyXLP
         KNkpX7TdHqvySBMJltwpNMD0KB71EVnTcQi6ITHFsuMz2rzXnzbvv2UJ140x1mhblpp0
         0SmRtj6YkjVQNcWGCh/zBi2ASqvbxwED5aGq15TX6mDFsrDkIUUbDU49e/WC+IaPU0EY
         mdMyBCaZqLu0w3dRUNiEIhyAt+v9NXEVZs8BUXG6rh7KzsthZGqLJ1evKSUs4npObknM
         j8twIjMPP19MAuC2RCrNy7gxyQnDRi19r23TqA1LOtienw0FO7jZeYGm5bO17U01k0j7
         4BmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature:dkim-filter;
        bh=5xpjNFjSNFRczxxgFFK3YrQ42HyOzHNfjfnUUCkT+Uw=;
        b=YTN4kidi4eHD4RbcjNeHoSV5cBiD4dYGsTINsSwlKY/H2PDiuHJ8mM4CIQFrCjjoi0
         gLenyWwYue+6JzdOesNrWG1kAijk2DUdziSclQMb92XD4RBJ8YBf+Gb3GjpYALofRa5o
         yop1D76/xKd/e6mIPVZZosDPL/1ZzKpb/Ayb5mWpPQxSmKf3burHEDl0h/hy7RQ4PjoD
         kjjsIaUMM2gQ3VqSX7MrushI0HUSifE+BmI1LL0atKpE4HhVaRsB609hqZTP/Kzrhlc/
         jSX+P0SpuXSvrtvSAJWYkxPof2qUb+jEVd2D4YkrUiqkICoikHNOXiwchMIdORkoSLUt
         dhhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=jhXVgan+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id og9-20020a056214428900b004c79462964bsi3641022qvb.412.2023.01.23.06.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 06:39:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=jhXVgan+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxz6-0006m4-Pu; Mon, 23 Jan 2023 09:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJxz5-0006lr-Ie; Mon, 23 Jan 2023 09:39:43 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJxz3-0008Kg-VQ; Mon, 23 Jan 2023 09:39:43 -0500
Received: from [192.168.0.20] (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id A5D6F20E2D02;
 Mon, 23 Jan 2023 06:39:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A5D6F20E2D02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674484779;
 bh=5xpjNFjSNFRczxxgFFK3YrQ42HyOzHNfjfnUUCkT+Uw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jhXVgan+hfwMxdo8W1p4qlW8WLVd3ulu8CQqwPElS8DV2QxaDVEJYXP1XppnXSZGg
 yYHyzQHo9Hb+S3xHixNXxZ2xFn7xpJ85GPFTUqwgduPdVPlpbpJdq+dmoRj+lipur4
 fvHuI/M5PX00bJUPNAttYiOmsoaazPs+9SMfjBtQ=
Message-ID: <3bb5a011-6947-8376-a51b-9a3c857daeaa@linux.microsoft.com>
Date: Mon, 23 Jan 2023 15:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/5] hw/char/pl011: add post_load hook for
 backwards-compatibility
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-3-eiakovlev@linux.microsoft.com>
 <CAFEAcA8RSCvkt+k2N+At67CYZejJgnrkqCox-meq0TtraooBCg@mail.gmail.com>
Content-Language: en-US
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <CAFEAcA8RSCvkt+k2N+At67CYZejJgnrkqCox-meq0TtraooBCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -208
X-Spam_score: -20.9
X-Spam_bar: --------------------
X-Spam_report: (-20.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PDcNlWUT+W2S


On 1/20/2023 19:22, Peter Maydell wrote:
> On Fri, 20 Jan 2023 at 15:54, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
>> Previous change slightly modified the way we handle data writes when
>> FIFO is disabled. Previously we kept incrementing read_pos and were
>> storing data at that position, although we only have a
>> single-register-deep FIFO now. Then we changed it to always store data
>> at pos 0.
>>
>> If guest disables FIFO and the proceeds to read data, it will work out
>> fine, because we read from current read_pos before setting it to 0.
>>
>> However, to make code less fragile, introduce a post_load hook for
>> PL011State and move fixup read FIFO state when FIFO is disabled. Since
>> we are introducing a post_load hook, also do some sanity checking on
>> untrusted incoming input state.
>>
>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>> ---
>>   hw/char/pl011.c | 27 ++++++++++++++++++++++++++-
>>   1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index 3fa3b75d04..4df649a064 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -352,10 +352,35 @@ static const VMStateDescription vmstate_pl011_clock = {
>>       }
>>   };
>>
>> +static int pl011_post_load(void *opaque, int version_id)
>> +{
>> +    PL011State* s = opaque;
>> +
>> +    /* Sanity-check input state */
>> +    if (s->read_pos >= ARRAY_SIZE(s->read_fifo) ||
>> +        s->read_count > ARRAY_SIZE(s->read_fifo)) {
>> +        return -1;
>> +    }
>> +
>> +    if (version_id < 3 && !pl011_is_fifo_enabled(s)) {
>> +        /*
>> +         * Older versions of PL011 didn't ensure that the single
>> +         * character in the FIFO in FIFO-disabled mode is in
>> +         * element 0 of the array; convert to follow the current
>> +         * code's assumptions.
>> +         */
>> +        s->read_fifo[0] = s->read_fifo[s->read_pos];
>> +        s->read_pos = 0;
>> +    }
> You don't need to bump the version id and do this
> check based on version ID. You can just check whether
> the old state indicates that the data isn't in slot 0
> of the array, the way I suggested in my comment on the
> previous version of the patchset.
>
> (New->old migration will work fine.)


Right, i thought this was a cleaner check, because it doesn't rely as 
much on internal state. Breaking backwards migration is not as great 
though..


>
> thanks
> -- PMM
