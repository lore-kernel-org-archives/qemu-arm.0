Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1111585ejf;
        Fri, 19 Aug 2022 10:31:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3d03:b0:1fa:c3e7:dd59 with SMTP id pt3-20020a17090b3d0300b001fac3e7dd59mr10934322pjb.11.1660930298421;
        Fri, 19 Aug 2022 10:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660930298; cv=none;
        d=google.com; s=arc-20160816;
        b=Kdi9Jlxou5/Nf0np0Mp5h2LwAED5DldJzNOFkGsItZ6kv6ydtpQtDKBhq9/X5vHwaR
         wuLKlzDffKZ6s1M+ILfjuDlziJqOAdlDXSyYCo6bRbnbdGFMLYj2OEsa8PdkS/KFPPJf
         Jwm4HALTJuOXB22uNnhFkdKYTOMKkEcDGtvdMPNS5qlkU/dhm/FjEzVQnzH3UdcS+ir0
         ndgHMevLX0vURSXQYbjdbEHV5DztL59PiTeUPeSZEKN5se39XF7zHu8h7m/CqAfCbDzp
         LFqoekhZJ35UtCAroH298vPkGO4QmMkqk/djRLASN74l180/k9lbYk6B+bnOX/k77som
         C2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gcl/CxCDJ7xwTvpI4kXCheCYk/TrvnPyWXtrzkbHXgA=;
        b=JMnbf40b7TcRykrzgSNH7LPr2fVOYCqM53eVr6qo0NA6DbeoMKe4zDlFxxYvx6/qYw
         P70GTA1kbSEhmCnjt/7HQRspWxZkubQj6w20fOL8+H+BPcAgbaooFGJheINhbYeAg6Db
         E3MDeB0LMMUYJWYc+0oLM9mF8AqsTIznIc9Bny01ir9cO2SeU5hzghkK8KClLIb2bai6
         6nVX8vLqyQV+YK2mu0oyHfT1kDtaRb8+4tERHiP3Q22PtHAe2Oh0jWAkn0pk28hdY3jG
         mRgtTB+vWt4/CQ21BIu4hSUA3EhAHP/z87ZQTJbs1RDCw0Is5bYd8o2TYUViwksvVDjf
         MOog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uB0lfutw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x10-20020a1709028eca00b0017086b1c41esor2177154plo.60.2022.08.19.10.31.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Aug 2022 10:31:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uB0lfutw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gcl/CxCDJ7xwTvpI4kXCheCYk/TrvnPyWXtrzkbHXgA=;
        b=uB0lfutwJTXOHMk9+9C5cdG60SP7XbWNS1/G54Gs36S8n9KFCISsM5jt1RMSSMvQ2l
         6BUzWF/rwSPYpertu5ICDewzCWMomPhoiR5OhF/QpAF3QVJ63cCKjlWKoTdtVEUClxRT
         4cTResXcOqRhqxK/KiWV07ejjKfVXOot5hRjGPv6SiMeqY/Eu6xZzkWMtGVPBlQ4G1kP
         nR+n578iBen8l8w9ODoD8plGNdZoSW68coiNprJ7QT8s/TChMh63g6XkpKzHldUd7fP3
         HQj2wLzTfBk8A3N1D+hByKlmkse67tDrW87NzxhlrnqbuQ7SdKVqQiStAFLGrFEJNgSw
         s4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gcl/CxCDJ7xwTvpI4kXCheCYk/TrvnPyWXtrzkbHXgA=;
        b=pG4WzZA6/Cyngi/C8TWc9JQw9plzxPUlGVfH2IpzLPato+sAlSkn3YwWfa1z6Pz2V7
         b+4EupB4DLyC/10Dgugn4sj2h2AEDdrt16LwVrrcgtj4JMqbohIWf+h5M3Klsd6fr3qF
         Sg3Q8zZLbrNeSB1Ma6/vAWf7rCOjCJd5cGIyknB+87HOSo3gCh3j/haexb9hd/vWtQyO
         1C7HzwLZ+vnHntPQ+8d3chRX5BW2ZnKVI9QCLknxf66G+vcuE55k8f3N48Z/NyguXxLt
         Td7UL2/yet5yJscUFwjzXsQInL66spudfrB0vdVDwVxzVVHbqGlxIzNW2yZy7CIQhCrm
         3seQ==
X-Gm-Message-State: ACgBeo0OjtgTKLykMoD5KwqsVBvjU0C9+4PchZzJw1pWvpTw1eaPB53W
	MZiWMtihuW7CeR5yH/iwNUR3/21Zg6yEj52Z
X-Google-Smtp-Source: AA6agR4a6lu9kP8Qx8jZItYBrvaZ0ybJxLgERwuXueaohU93+dgNCFlCyfeihPaxXsBBXwFSBnmr8w==
X-Received: by 2002:a17:903:40cd:b0:172:8952:9a4f with SMTP id t13-20020a17090340cd00b0017289529a4fmr8457070pld.66.1660930297817;
        Fri, 19 Aug 2022 10:31:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb? ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
        by smtp.gmail.com with ESMTPSA id ij29-20020a170902ab5d00b0016dc26c7d30sm3436243plb.164.2022.08.19.10.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 10:31:37 -0700 (PDT)
Message-ID: <b3cb991c-3eae-d7a0-7c85-ada4fd6114b5@linaro.org>
Date: Fri, 19 Aug 2022 10:31:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/62] target/arm: Create GetPhysAddrResult
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-9-richard.henderson@linaro.org>
 <87zggcmes1.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87zggcmes1.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MpXpXlgz4ld8

On 8/10/22 06:02, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Combine 5 output pointer argument from get_phys_addr
>> into a single struct.  Adjust all callers.
> 
> This looks to be an improvement - I guess the real benefit is the
> compiler isn't jamming so many closely aligned pointers on the stack
> frame for all the return values?

Correct.  The number of parameters is also down to 6, which fits all in register arguments 
for most hosts, including x86_64.   And in turn, we need to copy fewer arguments down to 
the subroutines.


r~
