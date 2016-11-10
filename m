Received: by 10.25.150.194 with SMTP id y185csp928500lfd;
        Thu, 10 Nov 2016 09:56:28 -0800 (PST)
X-Received: by 10.28.27.208 with SMTP id b199mr7632328wmb.82.1478800588414;
        Thu, 10 Nov 2016 09:56:28 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id r1si7089230wmf.122.2016.11.10.09.56.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id m203so2961936wma.3;
        Thu, 10 Nov 2016 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=AhrRSsEWLD2rK5Bs1t6nSLkeGUDZ1Bt1yHiDg+br7AI=;
        b=gjqFBQGkGNCC52M/7hwoVDMIKFFt38GYURqZTAYu0nR7SL+sz76WVsOY5lSOJbJNVf
         tq4Fi93mRuuOtMiCTeaLlXvidT0lXOmTPOW+DMdGxZNlGuUv5CtGUo2BiezihZWOWDpi
         zykQPL2mdQsR7iWM+K1PBq0lhbGFUnUd95jYDFfNfajwrEwBqZi8y29sblQ8XF4odnhX
         8jRv8x8AoQ66S19/Z/ravRxEF59UPtDKWNBFrFbbj17YUe8EokHMAMZTTqHWHh8gyp9T
         z0TNK7VGN9GuzhPc79ALAEKHjkws3rAsCAEKFMTUvCc/mItl2Mwafcf8DQS+dxqMHjqA
         1xsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=AhrRSsEWLD2rK5Bs1t6nSLkeGUDZ1Bt1yHiDg+br7AI=;
        b=S9tUWoVnjcj/m6JYTBPxQwlGjnE6if26ow4pDg+IaZkpgkmp7CI1bn/jXKa2D8ohwk
         TJaL4jV/cUNR6thcHzIUTCAwzdMzl9kMwPcjWr1s4Iy39Ljm9cmNHynpySoK6ls/Wdrc
         L+ne5Ndq9BwyStUFo9iBkLW+BVBinaZfgPNqzc4STNgMQcCjZi0yVMZWJRnE+Wbi0Zq6
         OmAELE4wnTUQK30egDYYfTXWTLvuRjw7eUsvg+NQyiDCGKZvoElGsr6oNYGuDBXD9emj
         WHB8+m76l+gMxjJPLTp0pTTIvm3QfitPf3VXpl9wWn4xd2LpC2eBmn1kNx7NymSksAjJ
         4fgg==
X-Gm-Message-State: ABUngvemmHy0xl1UvEDfdauvk4vOJN5X7XxAAnqxvAZH3mC4ci1tPn8al/69OH6TpIN/DQ==
X-Received: by 10.194.5.137 with SMTP id s9mr6656897wjs.133.1478800588016;
        Thu, 10 Nov 2016 09:56:28 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([87.111.149.139])
        by smtp.googlemail.com with ESMTPSA id n72sm14188084wmd.11.2016.11.10.09.56.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:56:27 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v6 17/19] target-arm: helpers which may affect global
 state need the BQL
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com
References: <20161109145748.27282-1-alex.bennee@linaro.org>
 <20161109145748.27282-18-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com,
 jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org,
 claudio.fontana@huawei.com, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <236455be-a479-625e-4351-3f4e705a660f@twiddle.net>
Date: Thu, 10 Nov 2016 18:56:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161109145748.27282-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iWcBOtdMpjSG

On 11/09/2016 03:57 PM, Alex Bennée wrote:
> As the arm_call_el_change_hook may affect global state (for example with
> updating the global GIC state) we need to assert/take the BQL.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target-arm/helper.c    | 6 ++++++
>  target-arm/op_helper.c | 4 ++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
