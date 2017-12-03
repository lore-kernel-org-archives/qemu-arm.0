Received: by 10.223.159.74 with SMTP id f10csp622697wrg;
        Sun, 3 Dec 2017 06:58:40 -0800 (PST)
X-Received: by 10.98.25.211 with SMTP id 202mr16293916pfz.46.1512313120192;
        Sun, 03 Dec 2017 06:58:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512313120; cv=none;
        d=google.com; s=arc-20160816;
        b=wD5Y0ku2rUdSZcEnCrcMJDDr6GAPDuhI20fgVf32MPUybXuDVTBLuu07rrdYBLljKZ
         xct/YLqls8GoWijYge1WguUS+TTMPIrzRk2f9bd144hi5mNEJnczcsh4GfFH1D51t+sp
         E/TKbIoEjnA2G4+Upi+JOeq+VDBNt0FqC1zPICys+qZVYLuBCb0EZP2x3NmLePRhw4+Y
         F67ygqq7K8tO05hNlVyobS1hnsGGNI6mhyHiBv8OW0JH93QyV9hTueBnUaxgTL3t6bWm
         S/e53y/e7BT9SE8qa3l95lBNLCjEL1M6GTgCbecJj8Mk9Al4ivFESyZ+Vwp5BJkYOV2h
         DBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=xMeJ1n4KMMK6FMeEx+0jPOfaurMGqsA1Rv4I/n12268=;
        b=oTKIhP7RLgtl64KELoPYS/omlJyfc4pD9bGaqg1FrxWPUd8Er2EzNVVEBRAYAtp99I
         qOGai9355P23X80uy7Hpa9SVtw8dIQx2p96SNIJZ5dejAlsPILFT5YmBbUMp3uzfH0v5
         MxPmk6M4BLv/ZGsLbF7u6neHN6RV/Q7cGcrKfF4MgJ+v9f+P2QX0ne9eggpZBdHUH05M
         KoIKeqYHSQPikdyj0RiDTkKHnS96wthyYiUGSJpnJzms+F+h/j2TwmCUOmHs8DvNcqY2
         dC+5qRfhsJvpSBRYOUlQYbvGkVd8enXW/hRcBwzgg80hZhyYqIo74K4E7cKGKWGDKENy
         jpFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOxKEqNI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b68sor2678802pgc.217.2017.12.03.06.58.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Dec 2017 06:58:40 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOxKEqNI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xMeJ1n4KMMK6FMeEx+0jPOfaurMGqsA1Rv4I/n12268=;
        b=dOxKEqNIJI+hvZJmFgzHqBGvoT35zbaYJjPuzThpm4cYk04aauPUXlDtpvFWY0EYhE
         tn+0mCZUfxqzaJKN4p1O62UrT7g9B4JUXknZ6tM6x1wXvYL0flFTQlrOXIZp5Xt7M7Pj
         Gw+I9E1LRlordSpyHrRmcm6KuX41RKryCrFZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xMeJ1n4KMMK6FMeEx+0jPOfaurMGqsA1Rv4I/n12268=;
        b=N5QNLljFYZ5Hog9NPTK6pvQ48VtOKgB7XkDszAaG8/lLn7coqXQgwFDi1qfIvQj+WT
         +9uGeafd8A0EWuk71AmztibuwvuqtqiTGJlvt4pYJA8Y38kHR3PkOWT7Q4N/BhUkolre
         n/DAcIr9AjZRkvBLYw7JsL7wGmcgAbB+eWXedSgIGpuSBzsdgZiCNnRJR4N2i9kJxYj2
         audsOhLAlb8HuasUUCRG/ybODVnlRKk+gp26iLDA6kfa+KPRX73e/3HTjELWsR9MWV8C
         Ane+b+ZAF4ExFRKgp4Tw2uBxxNCM8TIdGvq22rMZTAulC3ltpPn5kwJVSzmOjQR34dC7
         wPjQ==
X-Gm-Message-State: AJaThX5MHTImThqkyyYEvpnTOq8zqL/pZxUoPoXwq6YXP/wdgxn7zF+X
	mJQI51/M6txrCJsX8cZoHIwHVvS/2izHmA==
X-Google-Smtp-Source: AGs4zMZzGJU6n3oQgYGeNF2SwSIc4TpDNueQF6D5OgUUB8GDUANmkgPWp162VJjDQpnsQ15XJM6cWg==
X-Received: by 10.99.117.87 with SMTP id f23mr10353911pgn.133.1512313119327;
        Sun, 03 Dec 2017 06:58:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-111-33.tukw.qwest.net. [97.126.111.33])
        by smtp.gmail.com with ESMTPSA id 82sm21090512pfm.136.2017.12.03.06.58.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Dec 2017 06:58:38 -0800 (PST)
Subject: Re: [PATCH 1/7] target/arm: Handle SPSEL and current stack being out
 of sync in MSP/PSP reads
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37cb7baa-223a-2fc1-7eca-16cac60ba390@linaro.org>
Date: Sun, 3 Dec 2017 06:58:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: /eHGgwawcotG

On 12/01/2017 10:44 AM, Peter Maydell wrote:
> For v8M it is possible for the CONTROL.SPSEL bit value and the
> current stack to be out of sync. This means we need to update
> the checks used in reads and writes of the PSP and MSP special
> registers to use v7m_using_psp() rather than directly checking
> the SPSEL bit in the control register.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
