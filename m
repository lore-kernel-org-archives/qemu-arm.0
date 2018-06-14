Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2490657wrq;
        Thu, 14 Jun 2018 13:26:38 -0700 (PDT)
X-Received: by 2002:a65:42c2:: with SMTP id l2-v6mr3541111pgp.237.1529007998659;
        Thu, 14 Jun 2018 13:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529007998; cv=none;
        d=google.com; s=arc-20160816;
        b=CR8jMepLCC0GS+6co5oH4J+5z5G/m5bjGzMzyLeycCcqdgiRE8/ExWY29cCFuPP+bj
         KFE7Vv0OY/zkIuUlfJzW70GligRAY5iM/nUUoMyn3i6B/p76jsQE7R2ALFvt4blsR+4N
         P+81HSoKiBWm3iBAwOR8ugmCCd0Ks0J5dHVPidV6M3fjoSJoTYLEAt6fYf9hwIUqNqkQ
         19BGKqdHsQtncaVHPOYHCsQn5VyYF/MQ8lwnPPwfbk0tPdgOvqNECfezQIFs9O9t3kPV
         9YUGwwcphzXJV3Y1zkymnE/Bt9p+iUX8tjAhWo3Uo38LqPyB+0P/n3is0wpr92UUUQSn
         m/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=NakW22lKgDqwl6wNMNDvxG50FtYPxkJ7QH5bhqrUN6A=;
        b=MLy7+JirwKy4OuxaMcQ1KsX18Wp2PYCTPEKMlYBxbYrqKsh34vNKPz1r/b/QPCNvQd
         zTNXWXQUm5Mq+U550NAIhw1vgLXyRDlUqt6N5SDRagnbCKFl+SSExfpgxeXncWJrafnJ
         4GHyK+wZR6Lbq/QkKstYt/PBqWGHCMyq5O/BxJQxtYl+aXShbO1l1zPshJfLPN0UJWAM
         Bl9YVROe1xiLaxDdbWgIFpgN+j43z7J7aNNiuxahfFVoRHDJkX6p79EP03/VGHSILdcp
         t3ff+9VBo+vd5JSqDf9WkgIscpqi/+Ssd1vSRTs00dX9bd76M+3SojlBV5G4Lt3x82J6
         BYmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W0LWqoJv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a19-v6sor1810251pfg.16.2018.06.14.13.26.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 13:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W0LWqoJv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NakW22lKgDqwl6wNMNDvxG50FtYPxkJ7QH5bhqrUN6A=;
        b=W0LWqoJvJOe3vivl+LRfIDh7oaVIobS4bFEq46YNUnm7EoQySAYqkkKj6nY9VNLnQW
         xvPR8ibh5P1k7YZEoqfOXmnZ75M2YNruMUwA06MwrJGXzy1uaKeLqzkw9q+Vhlec+TB+
         j39Pjf202+iUtRScBgEMHX62u6MV7wLmR2Nks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NakW22lKgDqwl6wNMNDvxG50FtYPxkJ7QH5bhqrUN6A=;
        b=ZqRfeQEnX7nTbvOfwsorZKyM7O9kyEe+xEKlW5dR9cWsvAprerdmI2wORb/bNa1V0B
         y/liGAhreCO3LJzp+Vf8qJHkAGd4m4kUgQyqgQ/4/A+xM5KsvnkC4JHkyMqHJM6gGyKC
         ljDF+guC0Muzchw/S6eL4pwlSZJPnlObpFG7anOk3O/gROKj3YfKzA3AsWOFdJIm3NHd
         bUi/oHxo8EMWkIBoza1x4/qoYsXx9yZvB56D5fhRtpSxLnsDTydQepXYE8DIJxF53ArX
         wsbtuSPLbeYTTisaTBseTZKU2RzwnLeaaBawFEKy/pn1Z3GVRkIiqejbTjRnwbVaxbnA
         1dzQ==
X-Gm-Message-State: APt69E3O0UsG0ePhYtQ7RDlpL9B3i7YGoYSjFrYYshc9h5wDa6t7ZY8x
	Xh1V29yAQ9uNY5hSSULl0L72X+IN
X-Google-Smtp-Source: ADUXVKLrlWomXre2VBKoRmousgGfq1ViXmL0Q2vVC/YQanKVxDk0OW/n9K/7xonwFZU+YFW52/DgEg==
X-Received: by 2002:a62:ea14:: with SMTP id t20-v6mr11048876pfh.117.1529007998232;
        Thu, 14 Jun 2018 13:26:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id i4-v6sm9438994pfk.133.2018.06.14.13.26.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:26:37 -0700 (PDT)
Subject: Re: [RISU PATCH v3 18/22] risu_reginfo_aarch64: left justify regnums
 and drop masks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5764ab25-6e62-e86b-1a78-d59a82c45f7b@linaro.org>
Date: Thu, 14 Jun 2018 10:26:34 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RTmVDeYFq1fD

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> Left justification is more pleasing to the eye than the default. We
> also drop the masking which isn't needed as we are casting to a
> smaller size anyway.
> 
> This was split out of Richard's re-factoring work for SVE.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risu_reginfo_aarch64.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
