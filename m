Received: by 10.25.208.211 with SMTP id h202csp1680531lfg;
        Mon, 28 Mar 2016 15:12:35 -0700 (PDT)
X-Received: by 10.31.8.142 with SMTP id 136mr16425333vki.14.1459203155717;
        Mon, 28 Mar 2016 15:12:35 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qg0-x243.google.com (mail-qg0-x243.google.com. [2607:f8b0:400d:c04::243])
        by mx.google.com with ESMTPS id 73si4379488uac.13.2016.03.28.15.12.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Mar 2016 15:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c04::243 as permitted sender) client-ip=2607:f8b0:400d:c04::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c04::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qg0-x243.google.com with SMTP id c67so14195953qgc.2;
        Mon, 28 Mar 2016 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=d65Xs+pKMenPilO/5bqbZ5OjlJiGchMNXDujQ0C77tQ=;
        b=dkSmL317AK/hQPz64lGCYB04rJTWCFKphr26ZkYhCIccVqzdp9bc/m+QgaDVkEylaT
         H8aQkfKRaE7/WZ7iz5VsDI6triiVO06qR6l3PfLJ+BPpdM9P3v8lyckkfc1+Kow8h64t
         FQWBXeqwIljlU47ui/LBuCJkog4zfSX9NgMf51dk8Xj6wnnbCfgnySyQo2w7C6Dpz62V
         F4f1gspJDuQtofgPT2pkEPYEfIT6Tiv0LuYdul6MHdz+nBVO9rHsccgiFfpSzb/vr4E2
         XpXnDu4DCAEhaIv9ilNqDJ4nYFOrvETyRYJtNh7F54Lctsort4JRXfrqphjem9auwG3A
         ZRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=d65Xs+pKMenPilO/5bqbZ5OjlJiGchMNXDujQ0C77tQ=;
        b=d1zaqLqo9I1NZfvOktchjBefKUG4ZCoDv5QTUiG963c0z4eDOZz9k/Eu35gcVWTQZT
         Tqv0uw1cb0OBas2XVxH5t4haMpn8K3C9pk5om0W3TGXvM4nk/5Eo9X9PPYeDC3SOsteE
         EjLi+JZssKOU4kLOXBA6iPPLSkjl3jbvB03K7UOnXH/Rl+CqsfHXRJe0tkOM1G1DnYJn
         2wgWQ8Ff5yrgwNd6vtnA5KIpKL47EaVw96acYJt4RN5I9k33ptBPt+70W88Rqn4dLsb4
         OD/AXzz6Vn75is/GJljYlfGUYIxiXQqXHhQWQ6jl6COyqsChHkfVE06xY/jkQht28n+l
         Ptyw==
X-Gm-Message-State: AD7BkJLe2j3npU9BV0dQMbQMCQyYNcLkeTbWUS6ajiYrmy6e+hdo9CcFNSvHypRHHqxdLQ==
X-Received: by 10.140.93.166 with SMTP id d35mr38245650qge.29.1459203155174;
        Mon, 28 Mar 2016 15:12:35 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
        by smtp.googlemail.com with ESMTPSA id d188sm12750714qkb.9.2016.03.28.15.12.32
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 28 Mar 2016 15:12:34 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Sergey Fedorov <serge.fdrv@gmail.com>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
 <87mvpnrkby.fsf@linaro.org> <56F4039A.5050907@redhat.com>
Cc: sergey.fedorov@linaro.org, qemu-devel@nongnu.org,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, "Vassili Karpov (malc)" <av1474@comtv.ru>,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56F9AC4E.4070304@twiddle.net>
Date: Mon, 28 Mar 2016 15:12:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56F4039A.5050907@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Mp+MH8rjcfYL

On 03/24/2016 08:11 AM, Paolo Bonzini wrote:
> There is also a case where a TB jumps to itself; it then appears twice
> in the list with different values in the low bits, such as this:
>
>      tb->jmp_list_first = tb | 0;
>       .--------------------'   |
>       |                .-------'
>      tb->jmp_list_next[0] = tb | 2;

Of course, it begs the question of why TB would be in its own list, even if it 
does jump to itself.  We only need the points-to list in order to invalidate a 
TB and unlink it.  But if TB is being invalidated, we don't need to reset the 
jump within TB itself.


r~
