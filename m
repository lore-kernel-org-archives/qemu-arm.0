Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp788467wrs;
        Fri, 23 Aug 2019 09:29:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRnaE4/Rf7b9AMt5TUzrY11M+AAh7CzU7154opcNTJDSJOpvX2D0mLz8MLSt12lFyZBDql
X-Received: by 2002:a37:91c6:: with SMTP id t189mr4829733qkd.59.1566577753884;
        Fri, 23 Aug 2019 09:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566577753; cv=none;
        d=google.com; s=arc-20160816;
        b=JLJRoOdmUNjfBN4s7RuN/Vd8fP1jF11CTU18OR2ot+JZcdYtbWH/Dbxjq0GBvOUSr5
         sJeojxsCJeCRFiqtsrEqbjlfCS8wFfqe9E7/pspp23MlOCr5oxsY6ng9yOxRIEPCgWgw
         YJBC46qreplrP0te+NwFRm/EtdBMXVPA6YREW7RjTMK6tfSFGxNSDSiAnwpqAK4g9+zN
         renTolOvWTaahKJEXWt55THSmlg9H9b5QgaKmMTZigmDGvfwfZ8ziuTL53wkvpYNE8Yj
         f1DGDWGQxFwqRrFJSOK/j5DpRUpCmYHK7DlFHa0Hm5dLvBpJddc1d02Eqm3St5wBOssP
         qVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=nuK2lp/CodhYAyc6Wpf+jpECVEBYEi9MOcbES8SGeCI=;
        b=kktSGGNF1DrJfLjw4d5U2KfcDWtInU544+YlPpJJzv6iZ4TTvQikqgA+6TEeTAu2RT
         kKa6qc7Z45iTTba+9Vn5nuAWlZo544bHRkst67q+qT5rdDSmaEiPEHsEFVKlyZjWoYcM
         mLotkP1SKvKF0/5UuLld8LwIHQEN/i8mijhYa6jd4NJ/vAV5whuf0EHst9WEWCJ/3xkI
         S3QVuqnLaXTxgNAGpcwPD4SXO0k5HhI+WzdfZFRFkSUG/VYAFlsdg/mOAyoYon5oGp5u
         KvSL6bYl4qKZO00RDSkCY8QcAKlT2M1dk0qmuqTEfi+nRHOwv4RkPChC0zVwkh0phamg
         B2Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="d13aVcI/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si2270280qta.300.2019.08.23.09.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 09:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="d13aVcI/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1CR7-0000FK-CX
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 12:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CQa-0008KI-If
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:28:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CQZ-00068a-GK
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:28:40 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33049)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1CQZ-00068F-9r
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:28:39 -0400
Received: by mail-pl1-x642.google.com with SMTP id go14so5844286plb.0
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nuK2lp/CodhYAyc6Wpf+jpECVEBYEi9MOcbES8SGeCI=;
 b=d13aVcI/ciBaenuqQ0Vfsj5mRmqaQpXC4qvTZh0b3nQnLJ0GqOjP6B73H2d7NriT5p
 nnvMo4O2a+HDMzbPfos6/B3Hi7uSJRMysWfloa8DExKp9VYvVxj+O+sVIPkfa3lQ8GkP
 zsI+hPRII1eizuNXBXJEzYE2Mm2ZCI/pKPjayod5JxdDb0mTIzYA9uyJHF769Z/+M12g
 2ENKY4hzSgA26YDsKeCnYo+MIhI5cbToUicG2DTpKCyptF/bu7b+/ee3DUuo6jphteAz
 bFNCYMyLKpcUSX0n3eLI4/5nh/mwUba2LhldI/H7IDKijRqI+EH9xBW3Ky/1hwBl3qoF
 CYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nuK2lp/CodhYAyc6Wpf+jpECVEBYEi9MOcbES8SGeCI=;
 b=SmtFaVbrgYfPos4RUHr6B/DSf6jWvnpvxwc5e60ahz6/34DW0xYIuZbC0FYyaGBFua
 YfYeJFhF5aqcR3oPaEoFdhnVpaRutT4uTnZIdHbyTdaLuU0EfvgpvMJjEeSXgpgZNULp
 xracZsNuR639TGofrJKxIGncC/IQY6o4MZpBSWcYStcCPsvd5G3NdBJIRTz8Ib+5idEa
 SUfjsv7Bf0+27D0me8V/xEuS6NALQu8v4I1SkSBDs/1IIZrh8oyQevRgiLGzxMbQcJRo
 kD2LK2TOyWDtrLa1GN4K76Kh7Y8tOphFR5x6XhewBm3eXTgpH8Eubg6VE/Atk+Bwudqc
 I4Gg==
X-Gm-Message-State: APjAAAXR3VkhTLjLNFlt86Xv6o02tbM3XPOWtlRni89joQDBpJpyaVJN
 qDIe5u0ePFWEKXBwUeO5Je1jzCIaDUw=
X-Received: by 2002:a17:902:eb:: with SMTP id a98mr5489455pla.75.1566577718082; 
 Fri, 23 Aug 2019 09:28:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id u7sm3053337pfm.96.2019.08.23.09.28.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 09:28:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-22-richard.henderson@linaro.org>
 <CAFEAcA9VyafAcmhy2t_rSLBM7LEjn7qhGzbETjcnNbFnQw0GhQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8ae35689-69a2-2af6-2f5d-f2cce6aabaf3@linaro.org>
Date: Fri, 23 Aug 2019 09:28:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9VyafAcmhy2t_rSLBM7LEjn7qhGzbETjcnNbFnQw0GhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [PATCH v2 21/68] target/arm: Convert Synchronization
 primitives
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F9+VdSucRVe9

On 8/23/19 8:28 AM, Peter Maydell wrote:
>> +    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
>> +    disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
...
>> -                                switch (op1) {
>> -                                case 0: /* stl */
>> -                                    gen_aa32_st32_iss(s, tmp, addr,
>> -                                                      get_mem_index(s),
>> -                                                      rm | ISSIsAcqRel);
>> -                                    break;
>> -                                case 2: /* stlb */
>> -                                    gen_aa32_st8_iss(s, tmp, addr,
>> -                                                     get_mem_index(s),
>> -                                                     rm | ISSIsAcqRel);
>> -                                    break;
>> -                                case 3: /* stlh */
>> -                                    gen_aa32_st16_iss(s, tmp, addr,
>> -                                                      get_mem_index(s),
>> -                                                      rm | ISSIsAcqRel);
>> -                                    break;
> 
> Any particular reason for doing separate gen_aa32_st_i32()
> and disas_set_da_iss() calls rather than using the _gen_aa32_st32_iss()
> function that the old decoder did?

I think gen_aa32_st_i32 with the MemOp argument is preferable to a switch
statement that enumerates the different sizes.

We don't have a version of gen_aa32_st_i32 that also passes the ISS.  While we
could add one, a separate call seems just as easy.


r~
