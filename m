Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp324275lfq;
        Wed, 7 Oct 2020 04:36:40 -0700 (PDT)
X-Received: by 2002:a50:fe98:: with SMTP id d24mr2984377edt.223.1602070600764;
        Wed, 07 Oct 2020 04:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602070600; cv=none;
        d=google.com; s=arc-20160816;
        b=E7IN+ZRrTBI9sN9z1010fRomDjmwCNtYAxLifDkdXncK5bOgPZot/Yuka9DGzXSDOh
         chnRhj2Xj046W0lbUHoTrETJSo8mzlalzHfYOn0KGzod/BIZlLbLzhdstfwCbTF4J+qX
         twhb+CBHxWrtRaivv/q9Q3KfcF8mmZQtt5ym8sfwaGV1u3tpkjIAGHhTvB/2MX5yW9P7
         QwGi3wd+SMI3aTzgzrKLVEHiw+DiUw+sPGZinJDcKzpTOYZZC4EU6xkVJMapCOoZxT7h
         8MLMeAjI1DfmGQFaegZEVQzz2ZnNGcIwYXcxfMrBLZSKSjfzoVBDsa43ir6enIPXou4A
         URvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=kUN9GfVZhNkFseUOzxN2TPWLs4ulAQhdGEVJBlOHxuI=;
        b=g8Lg1tcAKRBja27XLNwL9phAsKFl3DtqPPGC3cdgpfm+VfU25eqQhTQdG+SFGtZMyE
         N3ZthknSWH0rG6V4GJ7umKFhSEbqs8cDaEn0JUqlq5aHaRbNCfHJYQ0N2XZ9Sa9IOPiv
         QDyk0VhVExenI9pJsRp6VlV6WSxpsSh8lf4S1UFIX8m0v0lGgV10v145k07pi5jDEPc/
         jHhf6/be4YP1/g3Ug64iAmqeAEK73jWKm7CfTX4Vi1JI4XGlkvDt2P8pFQig2mmLdkoR
         NhBN38kUrCXFX3faCYfHqlrbNpl/1fP/7akTARme7dkReVXe3vO5lcg3k6RdyW/NbFM0
         zRLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=oOhmXlYM;
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <74cmonty@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g14sor1006044ejb.88.2020.10.07.04.36.40
        (Google Transport Security);
        Wed, 07 Oct 2020 04:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=oOhmXlYM;
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=kUN9GfVZhNkFseUOzxN2TPWLs4ulAQhdGEVJBlOHxuI=;
        b=oOhmXlYMCYBRp8sI9pDhpqaFZkl2rRC2Dx4XlJ55ijcm/XO1kciZ1gYdeh7YQWC9+i
         OQlYSNGaD1vfBxhEi6/wj2lNwukdjipHT8zcpXxPt3KaRk3Hyc9miIhUuaXEP7J2EEpU
         buGpQcjeQEh6rnOpBP6QE3gTStu7WOGiJJWm1GH+11mpiDgE0KbSfjdFJsJnn8QHiPNr
         eWsf+18DOOPa0/WW8J75ASMLkCmd/0xuWlwLDDsdHLw2tg8wNzbgmmKPvw0jiCvKNn4M
         v/PRkXxou79L4D8SzOjJkDvjEABdNMAqNFImtmsK8eL3YvDdZUexx6KcuojNn2j7MC/i
         mgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=kUN9GfVZhNkFseUOzxN2TPWLs4ulAQhdGEVJBlOHxuI=;
        b=m9Y5sHkaNovn8QG4rqRfsN2BEbI2IZZ0TGRdGlFEqczAQkuEf8vk8ccFheUvugjXmE
         ykHiXaEmxvGKkvTt27H8nHMK7Fag9wBe1phPG/5nb7laA9J5qw43UcX+PpjLG4czzlPP
         4Bs9l8CAj30vyXRgeNNXWSWJa1G5SNg5Hg5cVz8DSXX0svaJJ+Ibmstl/GLpEG/LtJFy
         0Rq0nQKEd31o2WQRk0jNJaGXoBcPyAgcLnumajgrgJU+vJ3TQKxCAA4Cvo9bXLhJvlfO
         0d6zpUnScrbWqBOAkNXk/iMk1JhtO5f3Na7RU8Xqp6j6WvUb+9l9I26jDyS0nOI22zMr
         PLUA==
X-Gm-Message-State: AOAM531lm3YyPnP52AT8hzdl4Yhr44KP65ZtljS2dQ9wIsUoGc7xKG1W
	9/QGWIDuWnvHSW1r08BKmraG6SHpjQV6BA==
X-Google-Smtp-Source: ABdhPJz4uz6W6G2Tnngh0JL61HTUes2dMM1KJIPD+yB0SOSDWcFLi1oVhHL5CIvNGaNjYu+t4CA1Ag==
X-Received: by 2002:aa7:dbc5:: with SMTP id v5mr3181510edt.54.1602070600292;
        Wed, 07 Oct 2020 04:36:40 -0700 (PDT)
Return-Path: <74cmonty@gmail.com>
Received: from [10.177.66.61] ([193.16.224.13])
        by smtp.gmail.com with ESMTPSA id d6sm1284995edr.26.2020.10.07.04.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 04:36:39 -0700 (PDT)
Subject: Re: Emulate Rpi with QEMU fails
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Paul Zimmerman <pauldzim@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com> <87362r3cbt.fsf@linaro.org>
 <61c49583-c548-a8b2-7106-59011196f430@gmail.com>
 <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
 <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com> <87blhe1esd.fsf@linaro.org>
From: Thomas Schneider <74cmonty@gmail.com>
Message-ID: <f32593d0-e87b-0549-7b59-f58da24c9130@gmail.com>
Date: Wed, 7 Oct 2020 13:36:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87blhe1esd.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ogHQ49jUOEK9

Are you referring to this tool?
https://github.com/stefano-garzarella/qemu-boot-time 
<https://github.com/stefano-garzarella/qemu-boot-time>


Am 07.10.2020 um 13:00 schrieb Alex Bennée:
> perf to record your boot
