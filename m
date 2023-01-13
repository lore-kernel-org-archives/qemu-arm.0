Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp708298ejc;
        Fri, 13 Jan 2023 14:05:17 -0800 (PST)
X-Received: by 2002:a05:6a00:198c:b0:582:d44f:3948 with SMTP id d12-20020a056a00198c00b00582d44f3948mr36899997pfl.18.1673647517420;
        Fri, 13 Jan 2023 14:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673647517; cv=none;
        d=google.com; s=arc-20160816;
        b=PnMGertA5g43xhnj/Ey966D/uiKtrbfGcEkxhHMg3vBFL78Dyt0k3Wgdv592d8yv/N
         i5hMHL9JIoNQO2UvCO+51ftZsMRXxsfuuuKRtdoaGedHeS8/aFYJH0YZKrSfebk6bRTo
         XEt3HWo810U+88MBKyN4b+Bi/cjo06orXwbFm7H4Vmo6McZ5OOyYOIqj5zV1wFleSKcE
         EPFkBvQeKV+CMODmgc3s5+ZKGCO7CU8BeN/xV4N4NYYdkmowz6a83FrxWDKuNAFuITDD
         ZUf27LebUrAonq7oUUnwxMueIY3ATcJxXU6qQtqZetPw494qVo1dCCrERyTTUNKX3Rlu
         5Ayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CPatGZdqtcKWZEzUuU2RAvA5NjsjbyNrc9rK1pyXCQ0=;
        b=cs5H8VdewbNPCGdpMZ/C7UC/zY6yguFZW6QacWa9tsuxd7TdSOpcVt7Rg2jBVh8tfT
         EvL6iYxxxh7xfHnG5ITeAL3xw3L0uLdwisBY7gBYKSaVZhh2rp/8Rn6+qrsULRyQKx7+
         d4ZlBda0vuOxEzaUxQXbm6gubpk4Ic8sKtJRczpCxMv+PJ8bi3nb81CnTIbABIvZodWc
         s6quIGMlOVvQahHxdD1VVd7PWz09W7w8zEv9DHR+LgHw8ji4DPbHer95tj5Xn1tOqixR
         kTIT+MNGRQp7WN0/RgqND/jVa3DixWUJL+XZwcMzI1CeeT8h0Nm+bCIihW7baVo+r1/9
         SSlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hnohg1fl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j20-20020a62e914000000b00581da213e54sor11618546pfh.78.2023.01.13.14.05.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hnohg1fl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPatGZdqtcKWZEzUuU2RAvA5NjsjbyNrc9rK1pyXCQ0=;
        b=Hnohg1flgaLoOuo3Xc7snE5g8On9ybXYzngyFt4M1shQ9iT3RI0Hi3kzUWN/wvk5H4
         2FgVkU4QCGez/F9UVDKPC7k+1wqG1XDfatVkCXS1l3bLuikUCRo7r2djbMIgLdpm5I86
         JpOjh22PKO+HnZpxKg63qfSEHoCA+5K7lmBEBn7mu7prd8wUVnZ0cR5519JOoWla28SY
         fhaFsVtG8JMp+0KmKck/BRldJlAYMon6fp1Wahn71cZz5rKFzHlmKuV8ynP2NK9Lal6/
         YD7b7QzpEeNe92lT7rJgDMWbzFlAWVvUHQGknZobtIqEURMdJRhUljzToQtBMF8xvzyZ
         OJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPatGZdqtcKWZEzUuU2RAvA5NjsjbyNrc9rK1pyXCQ0=;
        b=C3waeB937FCV3SOuam4+PVMBB7U7XmETpULFvWjwqqCR5fKt1TqExu1jn2MlZkgZmt
         pxXMSTz+0J2wsaGUyQCQJhpHIlvLQ/IeAVnt0OyOaRwpnF7ArnQDSinA/JawADg/ugqW
         8BmMkXD5Hv4avPfhW5eFty/Ue/fbMyh2it7WZt0iK1FC/Wyq/fGH6+ciTTyAQX4O4lGZ
         biow54fh0eboEqahQYpSwcHk3DD778TGpccb5Dwc7X8Y1ciiT1tK32Nz6ohy4nmq3Wo7
         n6QCn0vGNo0uBOHtt3HMUWxPWAJUVdM5ZijRINJ2qBjYgRqOmCsZXfsCQI1fc4vhG/lh
         //Vg==
X-Gm-Message-State: AFqh2ko73Fn0Cl9HDpz/mU3I0SMzuyk53y78ECzwBOkSLjtxltzBRD28
	Wmi/RUHICWNiLawFzQw5w5DcvgE5
X-Google-Smtp-Source: AMrXdXvbFwDrOuvySoaGSKg9mYSk1KBeOrdHjoILX3ItHTzKkuA6tnlneyFjj0+bzzfpj6UnKGNTXw==
X-Received: by 2002:aa7:9732:0:b0:580:d722:10e7 with SMTP id k18-20020aa79732000000b00580d72210e7mr75512301pfg.24.1673647516902;
        Fri, 13 Jan 2023 14:05:16 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id f13-20020aa7968d000000b0056b4c5dde61sm2180303pfk.98.2023.01.13.14.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:05:16 -0800 (PST)
Message-ID: <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org>
Date: Fri, 13 Jan 2023 12:05:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-21-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5E93cK/efArS

On 1/13/23 06:04, Fabiano Rosas wrote:
> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
> cortex-a57 as default cpu for KVM.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>

Ideally there would not be a default at all, requiring the command-line option to be used.

Second choice would be "host", since that's the only value that's actually usable (except 
for the off-chance that you're actually running on an a57, which is less and less likely 
as time moves on).


r~
