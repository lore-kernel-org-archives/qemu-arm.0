Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7544979lff;
        Wed, 15 Jan 2020 14:40:16 -0800 (PST)
X-Received: by 2002:a62:8602:: with SMTP id x2mr34064266pfd.39.1579128016407;
        Wed, 15 Jan 2020 14:40:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579128016; cv=none;
        d=google.com; s=arc-20160816;
        b=A4Q025563m1P29hjefJzQU2ZO74IS7KZeEEShC2sEBPtjVpmH0FWAOxyz9WlajGxPk
         vt/Tx09Zyc1IMjee5PXKupJxtqggcbtCcB/3XaFtZu0H3xYo2/2Xrw/wkMOGUcWw90A7
         pgDeRNtiYuPtGB1sFrIqguVhUGnknHlbJdcCf8NrWTDETM9afdwx3b0SLmgq0Y7eTSTc
         /3vbFt/JzKJ9rBkzfIFyCxU6sWxImZlFOLFa+j1F43rkbO1uUHYwBGR/yEygodxD2kMC
         hjAebMzNqJrZ4hjAFIeGEja7nD34OA/aEDBMXkFy8MGxlaodzKDif911C+pIuE4jCqV1
         8BqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=rUKxely0jB5mCwPXbWuNTZPyd3SSVMnADY3Cx3KuDYY=;
        b=MwhTUze66ilUyjsQ650b8AAMyXQjILJS8NfV6KoYVZmU3hCLRp2WmY9oqkpmY7IRUD
         Jh1VYSLilYyYxF4KhbPEETEBCD6mlxVBexKRKm+NL2Iw5SRL/LnZ/1IzTwB3T6/RacaV
         QnZ2ZsYLJnjKebrrReluaouOcIqVuKTZTp0jyQKtRqbQelQ/Q+EWFSY1KPZ+LiDUX2Cn
         r96iOnExYZaMxBGC+ieHZS1KOBdNbCfA9dh8uqC1ceqR8GXcZYhyjazy+zrvgnwYs6sw
         NBNdHXIgYIKBl3oP2QRVnIPyqPxGTxhRLme62a/nUWB09c3mgeP988bEhZZ/6ZuPAi74
         orbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qs1gw+cR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q15sor21872065pgs.22.2020.01.15.14.40.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:40:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qs1gw+cR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rUKxely0jB5mCwPXbWuNTZPyd3SSVMnADY3Cx3KuDYY=;
        b=qs1gw+cR1YdX0tXV+r/13bvUaiNtMxgd2AAOJ4cjgJ4ZCGJ6V64Sz5PKfUy8SxdbSU
         IWDS6+7Ka3gQxqJNdi4zsw9a9SQZ1oH8nlMtn0IAfSlWZSnzd2sAKFdqxvroavxd68lK
         LXJaw9ZTtUcvqehRcBltJVnMWWysdSxQVEzpz1vUPm6UiMQ4p7n0ZnZnhoTtzOWpWS4B
         6l96igMl6YJAta5XhZsJ2f8W96/jFewsujLp7w/2hHSJ/BNT7yrzWRmASzdUnw4JMOQ+
         JfJGCJQUEMzjRoV2SKmRHDHF/IXHcam7aK1JeI0ND1zzHLokd+F/8lt7tHUBkxEcBhLT
         s5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rUKxely0jB5mCwPXbWuNTZPyd3SSVMnADY3Cx3KuDYY=;
        b=FrYesNChSfgCgsrK2vW/bw7egkchq7BMOHoqgwzGFBqXyzwJdOm+fAOLkfdNw8DQEU
         QqOVBTsjroXwlMuAoGm5smhsVkE0lLEQrrJFmTAGQpVEB81TZh+3F8drA0jYV7OjBY27
         km+x9UN9ghJr/aegR+WK/Y1GhnMlB1yjBV9wwHK9211nVIUuhyfD6AE3rgfsznsnU4iA
         +g239qfwCL7RnTL08d7VdwUoxNGFxNKvTgLOffuRBuZ/fsphePOFs/SfETEIG3W0BFGt
         6epbdq/leSd4Rs9bV/9KQYzXo4CIuMYbUu2lhtvCTON0OqUVY8XM+162XVdjVtLXHFYb
         GqKw==
X-Gm-Message-State: APjAAAX+YdatpcuukI+Nk1nlS7TbIeAHGBJZjENZDNudp88kUjvQahgE
	MS4eebjdLIWOzQ8qJJz66Cd7I6/q
X-Google-Smtp-Source: APXvYqzRUfizG3sfOmSH+PvsyvJYbrnq/YuPWmCC9knk/sYJdk4GiUf+ZhJwHCvRnA3awFSqf150hQ==
X-Received: by 2002:a63:2cc8:: with SMTP id s191mr35431686pgs.206.1579128015872;
        Wed, 15 Jan 2020 14:40:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id d2sm827381pjv.18.2020.01.15.14.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:40:14 -0800 (PST)
Subject: Re: [PATCH v5 17/22] tests/guest-debug: add a simple test runner
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee254519-7a8f-aeeb-4c55-07c7dfdab109@linaro.org>
Date: Wed, 15 Jan 2020 12:40:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: XgP+J0gc5YRL

On 1/14/20 5:09 AM, Alex Bennée wrote:
> +    gdb_cmd = "%s %s -ex 'target remote localhost:1234' -x %s" % (args.gdb, args.binary, args.test)

It'd be nice to wrap this line.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
