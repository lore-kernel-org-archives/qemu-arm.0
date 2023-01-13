Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp702599ejc;
        Fri, 13 Jan 2023 13:53:11 -0800 (PST)
X-Received: by 2002:a17:90a:9307:b0:228:a39c:8d11 with SMTP id p7-20020a17090a930700b00228a39c8d11mr12390934pjo.1.1673646790854;
        Fri, 13 Jan 2023 13:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673646790; cv=none;
        d=google.com; s=arc-20160816;
        b=uJSXqc16ebHV2Jry5yGkGVyFPRHu2cYh9riZtEiXXycCVPMXBJ5f05G1dldAj+n+5Z
         kdtFagsvYUOOWd+nFcmmhOKurC2NxEALaBUhB/PjmD3CZeWpcU483G/+mKDJFym4v0KH
         2M8zN4J4NlChR+KYVOnL0PYh7a4RFdH3K9iQtybOO6h4Wtfj3Za4vx2urPqwYoDe1O6y
         mLBH9lpO6suPx5pQOnFxsV1Djl//xVb0qlhKa+yAEHIN5LIBwxZbnUS8JH88tKo9gkNj
         pwQtFpV0DOfpSipiJs3j90qNm2IpxnQS5Fobpv94vo7Z05WH15vXC29ntB54Ek4w4jkx
         vPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yjPEazlwvwtxjBRpRghWMaaT7Vhs9FH+tDBK1Pp/uMY=;
        b=s8iSH+jSXePMfgTiFESNQZShbA74DXhXgvwlCFSXTjuf+gOYiHQQ8H/KrJlz+5Wcy0
         ZXKeH3sevxFq556ugaMPD15mZruOZ1KQtwYSAPQUgt1OSBF95AcnjDEi/6wqidbTFMKn
         4jju4MTgrn7EQtXf3Wc+nKWm2UIWjz3uEYrFCdVp0xu4aaMdo3VaNoVuUsf0orZDHaU/
         j92ir0PY2vxpcVfUVdJxQWDSsFZ3oJ0rpTIKyF/HWoqZCsSJLG9IKBjJ8vEKBNCq9y8M
         hX8hXsEr+1HVs2G1kCkM1zSIEf3bABgWBYv7u+4r1D6fe+qEdzF23B98aruLyt3lMEvU
         XMMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bxw8E+ST;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d14-20020a17090ab30e00b00225cc1ab378sor10778713pjr.41.2023.01.13.13.53.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 13:53:10 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bxw8E+ST;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjPEazlwvwtxjBRpRghWMaaT7Vhs9FH+tDBK1Pp/uMY=;
        b=bxw8E+STomA8T4dNH6I56QGbe2CwYFtrCU+NdcWjTglb1sLTSKlqIhWCD5E+CqfdTk
         FLQmYAtV0F74YkikzoMA0lsikmhG4n/wAyBysEgXyIHQnMsvljWtRhmbSVQ+DycueWR/
         +GrhkXS7OP0vDhwCwXoQZ7aIJrzj4ZAA0MVN5YvatrIkaiLZaUdVFqopNhIVmYBj86ax
         O1pVib/HG84lSgn2nWz4nKefNspcm/liu2F4qrQGDm5varFZB5XeCqSQnFdesAudjzLt
         PJCr5/Ofe9Pac+N+l8dUOgiQu3wxvtNKuGKt18jFr4Y3UPYcC1cvNt01LpS55yH4Ixd0
         OrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjPEazlwvwtxjBRpRghWMaaT7Vhs9FH+tDBK1Pp/uMY=;
        b=qG/zrsXXhLL+I+hkt+okfAK3HZ+LHSpUoRqikIFl2BKFEZiint49XlTA7WBAsB87Du
         ReeLh/mmDx7n4Woq7qEDCbztW2r/qwoY20fJ0ErmM0UJLvtyoiv62kXCKcX4FW9xX/9j
         4lcz2xOvl1DzGB3WvJS43r75OLv+Nl6BFdqL+NHRIy3hOs6OoHk+du2kBTtmwpxxVr2g
         iCDunkkYarJxrwvXub+tpPxUKs4T20KJJzYPtny8YootkkXhSfrzxqoDZ5P2KYGFFTQO
         Md76tJ/9d0OzhXZo47hNvUEZupr306PpwTducjGzAjMdwz4wujHCAWu9lJBqDheaOCrQ
         4OJg==
X-Gm-Message-State: AFqh2kqO3w4puMvwEKZ+qmFbydH76z8LjesFKjfS5LRTF10p58qx5T5K
	oPZUIBHwOEFdBpbqqBsshKsjmINw
X-Google-Smtp-Source: AMrXdXtQuhcN05zTrUAUDPROH2w0lnHblenDRb5j0w2niSkg+0bD2lhIzKeVYn50RC440VnKV/HZ7Q==
X-Received: by 2002:a17:90a:1b6c:b0:225:e016:e2fe with SMTP id q99-20020a17090a1b6c00b00225e016e2femr13133241pjq.31.1673646790410;
        Fri, 13 Jan 2023 13:53:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id p3-20020a17090a868300b002132f3e71c6sm28604pjn.52.2023.01.13.13.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 13:53:09 -0800 (PST)
Message-ID: <d815d52d-ee1e-a7fc-7214-6d30d38cc447@linaro.org>
Date: Fri, 13 Jan 2023 11:53:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 08/28] target/arm: Wrap breakpoint/watchpoint
 updates with tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-9-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-9-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 3B1gcxxi2xK5

On 1/13/23 06:03, Fabiano Rosas wrote:
> This is in preparation for moving debug_helper.c into a TCG-specific
> directory.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu.c     | 6 ++++--
>   target/arm/machine.c | 7 +++++--
>   2 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
