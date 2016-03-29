Received: by 10.25.208.211 with SMTP id h202csp1899828lfg;
        Tue, 29 Mar 2016 01:15:04 -0700 (PDT)
X-Received: by 10.194.94.229 with SMTP id df5mr1241763wjb.133.1459239304915;
        Tue, 29 Mar 2016 01:15:04 -0700 (PDT)
Return-Path: <paolo.bonzini@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id uq5si32894531wjc.43.2016.03.29.01.15.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Mar 2016 01:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=paolo.bonzini@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id i204so1292243wmd.0;
        Tue, 29 Mar 2016 01:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=miUfTFIdAKNQENzSqfPvj9mlLZGtDHrzApGnwAcolYo=;
        b=VYLIoasP1tBYHyBQDYmULPd7hyzMl8hRWestT27tL6byiyIAL37dYlPq7KBBHTRopQ
         ahNIpjWMRAo0N9foCHC6uIk46v8VhkLN2SQqOSw37gz+Wto7t23EzrmO3RKLHhMO4fsE
         QvYaJdqEckM1LSWnKSjr6j/kEK7IRqvN3shPErPWdoABy1RtYpj3UZCJbkUrAscqNkBp
         xnxj7QNV8Fwpi+LCoH/jw0y9L98Io+CzBUzzOVpivhlCAkzoG7/ry08WliR/nS/0WsDm
         av3EjDtBd2hk5C9ioisIRdGsppdnhefHmv8oOz5HLNp6hpbQ3+o5iFsoPaz1RGT4FvWR
         yI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=miUfTFIdAKNQENzSqfPvj9mlLZGtDHrzApGnwAcolYo=;
        b=CvcNS23jof1azEcB1ixv2PowssSiXtM5mOii4ZI1UtZ0Z74RJT27Scz6L1rNEZEnz7
         Gacrs2llqtyXEWe9sVy+ccZxoWTOWKEaKW7Tyc5dLEhcWcO1BmEd1muPszF9BMAmGuHw
         C2PLOGpGR9hX1oPoMw8vtxmldn5bRnVrdyx4pSM8dWCggdycdlm04YrmdXYFQYOGnQcX
         l7pmv//gYoNuuXuXKWe3/Xi25yUa72bi1ByN2VwDefa63ZJMs3YgR592icJlKbrN61kL
         aqe2zD61n+sxMJrEYDEtXDZ74GqI+JOrQw4g8a/AH3O7jqxAIvkie02QFqbFtgaQMEsB
         mAJg==
X-Gm-Message-State: AD7BkJLi3FyvMPon4mrM9kT6tipyXtfeKckZ1ekavN+LGLH79ircnOKGANsJypmZ0tfKsA==
X-Received: by 10.194.205.103 with SMTP id lf7mr1093232wjc.147.1459239304673;
        Tue, 29 Mar 2016 01:15:04 -0700 (PDT)
Return-Path: <paolo.bonzini@gmail.com>
Received: from [192.168.10.150] (94-39-141-76.adsl-ull.clienti.tiscali.it. [94.39.141.76])
        by smtp.googlemail.com with ESMTPSA id c71sm13511736wmd.4.2016.03.29.01.15.01
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 29 Mar 2016 01:15:02 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Sergey Fedorov <serge.fdrv@gmail.com>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
 <87mvpnrkby.fsf@linaro.org> <56F4039A.5050907@redhat.com>
 <56F9AC4E.4070304@twiddle.net>
Cc: sergey.fedorov@linaro.org, Peter Crosthwaite
 <crosthwaite.peter@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 qemu-arm@nongnu.org, "Vassili Karpov (malc)" <av1474@comtv.ru>,
 Aurelien Jarno <aurelien@aurel32.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56FA3981.60608@redhat.com>
Date: Tue, 29 Mar 2016 10:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56F9AC4E.4070304@twiddle.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: G6sIAAo6wOIT



On 29/03/2016 00:12, Richard Henderson wrote:
>> There is also a case where a TB jumps to itself; it then appears twice
>> in the list with different values in the low bits, such as this:
>>
>>      tb->jmp_list_first = tb | 0;
>>       .--------------------'   |
>>       |                .-------'
>>      tb->jmp_list_next[0] = tb | 2;
> 
> Of course, it begs the question of why TB would be in its own list, even
> if it does jump to itself.  We only need the points-to list in order to
> invalidate a TB and unlink it.  But if TB is being invalidated, we don't
> need to reset the jump within TB itself.

Isn't it just because TB acts as the list head in the circular list?  Or
am I misunderstanding you?

Paolo
