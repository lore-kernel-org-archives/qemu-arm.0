Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1490045lfa;
        Fri, 4 Jun 2021 14:01:36 -0700 (PDT)
X-Received: by 2002:a63:3704:: with SMTP id e4mr6763460pga.310.1622840496436;
        Fri, 04 Jun 2021 14:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622840496; cv=none;
        d=google.com; s=arc-20160816;
        b=Jm+H91yKuaPBKA9UMpMUM8euH+kjCUqwQ4FDKuXnZ4MUQO+jwB/X/lv1/FiWvZ9y3W
         h7/2WwvCxhbeDfr1DxTRhB10jKoZzLmSZsckI4PnZjNNQX7gojnAyyJzqg157tZsQTZ7
         lAIAqKaoybcP8bjrj/N4V+8u7gqBqVV9FhSJ3WD59zfAFhiFsDMOzRj8l9dn+cRzIcy7
         1Xn7h8u2Fdg4LRA/ybBs0q/aiP35ZFzCsHlpb6h9/0WNh39r1Y7rZS+CoeYcCAz0PVCX
         CM5Gq0BETuNO27roUoNHzrfafjFHjdEmn0AbffxpPERH3TYmvYassaKdNAOehn2KGKlJ
         XvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=xc6pBBUIVORGRE5haa1GPmqcBzbpGRkbcaNsUtcR/C4=;
        b=B6PdDJIc2OdRv97eYg3IdAl7Fv/xkPV8tGKz+oJ6ykG8CkAOzeCyNiylL8VYWd9FY9
         HrENmp4kBJOhQIiboEk72H2hb65kgR2QLeraTATbePb+e8/zL+0FFLGiK1PaJDL2mCdw
         J9qR9iUdclVqVD1wEOjF+4YwLSB/kgR6qcmbHjOZYN47goOLX32ylQTdI6zuBStgJsOt
         Q7tLU44QS5ZFTrhqw/lajUrTT3Xdn3Ew05SQlGzeGa1nlvtvfjsC34VokBo3lL6dAy0A
         dPds5YYkbWhx9PGFZ7t/e8du/xuovM9QH2QQamBcC7oBKfuhE5X8jw77Uhtg6eDoc6XK
         mybQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rLGT9k6w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j10sor2257730pjl.35.2021.06.04.14.01.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 14:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rLGT9k6w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xc6pBBUIVORGRE5haa1GPmqcBzbpGRkbcaNsUtcR/C4=;
        b=rLGT9k6wHyJ+CWdZuiiPPJcUiYdqrmeaLscmbvLlYUf/1RAdfUsIR9/+59d3tfkF9P
         WkpQL4alD+6NkcMnYPS951BvptfTN4hB9NmTma2qfATJv3Ggeouaob1c6RxuelNqGuvT
         tVCBKnhvTybLrlNRcamtxZEnREvXeuuSlWXgssA+axIHWSaRK+xt9bP0Mp1IPn4hay6e
         xoVXFt3KPIYMTbRa/I2ghyot8gm3L+enhBhYXLy+gdnKTb5XxWdHiu2G2ckvrZUiu//T
         tcueRkUdEuBsmRnfzhh2X9Y/UFcoDYTLJeueg/60+XpS0j/0V3lqaXfxh4aS3MIKXy9c
         pJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xc6pBBUIVORGRE5haa1GPmqcBzbpGRkbcaNsUtcR/C4=;
        b=a5kbIktB50/zqonxRqSbLbvP+s+rYZPyZVumMHdVrwozCkodRIoZ9MSZBYWO+1K8+m
         ZtbWSd3ULcT5eY7bjnZifkVnjjDn/Ej5zzudx0XLB9mabbmiyjIVIQomVHKFmYFyblUl
         PKvyowynar/eZkGx1SyG5iTKaevfXYlBwtanEjAnj8kaL3c9ioIHxo9FyueLRp44jalW
         iQ/ZcWtHZoEc2uH9shQEBUvlqofQKq6V18Kjn5S+Q/hiweF90Xi4ke/lHjeco0uYyQS6
         qrCSro3c0NNTB+eAcqiFB5pMOwI8eEzMZBOzB1Zjv5aOiU5rHCmuVaFCdEJore1GSPXu
         e3zw==
X-Gm-Message-State: AOAM532yx5nxFevX2jh0jnOONVU7sDdadg2FySlwbqWtjU9fLDrLyhTY
	S5no3ZFtSri79EEMKOhlmCI3PZGE5Z4Yy3PB
X-Google-Smtp-Source: ABdhPJy0RU0IRxcEfjY8aEM9lBGNS7zBeJsAqNkZcIrVvkwFYLZeon1meCdAu/pCp/sndMuGHVnjjg==
X-Received: by 2002:a17:90a:e2c6:: with SMTP id fr6mr18752137pjb.198.1622840495825;
        Fri, 04 Jun 2021 14:01:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id q68sm5537570pjq.45.2021.06.04.14.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:01:35 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0411b63d-e610-fc7c-6910-518752086fd6@linaro.org>
Date: Fri, 4 Jun 2021 14:01:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1oUqbqOzWPj/

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Use the recently added generic qtest_has_accel() method to
> check if KVM is available.
> 
> Suggested-by: Claudio Fontana<cfontana@suse.de>
> Reviewed-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-5-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>   1 file changed, 1 insertion(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
