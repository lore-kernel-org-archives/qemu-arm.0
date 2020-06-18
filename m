Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1789444lfm;
        Thu, 18 Jun 2020 09:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMqw8b0I8HdBA/25Y+BHE5Je6K/ZEr0UV1fZOZmuUoAnfTxVSeDO+Dp/SaYSs/nD6eN0tO
X-Received: by 2002:a25:388d:: with SMTP id f135mr7504402yba.201.1592496796829;
        Thu, 18 Jun 2020 09:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592496796; cv=none;
        d=google.com; s=arc-20160816;
        b=HubpozuSz+f4zstuu+IyL0jRa1TEvRPznKerxLsyCpccSftxmyeRaU02q96tuJY+3F
         l3mOxb+CQwZ/bBwZxOTZGlJVNBaeu9OkM5psgJczCuWO3GUa2RuKoB2nTcDOnJnAigNe
         OT+0McAZOLNHaeU1PFhbgioEoh1RIgqJpeIAGcXpcFH+x3cri0rrXOXGq1clz1p84Xuv
         FdSPVqSa8U1tPHrQ345WC082W1tFdX3N6cE6N5KX3nUi+gQL/yIhwOLxJ0N8N86iT/lc
         6DhyiAaK51v/gaPwhjdB3KeE91+We08vpw8tznRZnkv+pH5JG7KmB6cv/o4p8WY8vWn6
         zE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=w8f6R9ASZrt/RtlltLDdWpOWT0IDLH/5n6K11WS2PRg=;
        b=yx5dXoJOB0kL67x18hImXlmJScr9Li7WVpVRB2ttB9COC++g8KOXP1w6qUuHFjhPYb
         2xtMz8F62s4NnAEKmzjFc49h8vTCX3i3l4q/UqMWp7KSfwVF9Q39HivDbFr4cpSYGl7h
         rPkSHB4Gch/Kfl+wvOYRMhlEt2gshEfyhW0ni93VzNEjIoN14i0/ogz8eESZXnhh6m2c
         WPgnmgt+s9dVqwCrYT/glADpiha4DC38DSCgZiQYKA7j0BZpDoTuO9LROt2aSCju6HOq
         LsegWRo099CIZiERPY4eFVEnBwog3lgaAVMH2rYH+2pMcJk/xCPACewkkfhyMpJLf7zz
         PB8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sOpBM3ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e81si2888140yba.149.2020.06.18.09.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sOpBM3ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxAC-0000Yx-6T
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlx9m-0000KV-7y
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:12:50 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlx9i-0007Kc-20
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:12:49 -0400
Received: by mail-pf1-x441.google.com with SMTP id x207so3000075pfc.5
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w8f6R9ASZrt/RtlltLDdWpOWT0IDLH/5n6K11WS2PRg=;
 b=sOpBM3ixtF3o+lHqUyO+JOrLGJ59F5P2s1WNYg+o8ozhf4MKWRvQxeOobFUvI+V95q
 u7jb9bLl6u4Zan9DUI17SeT+yy5VAiRRG5Ng/XPGZITfkzaTS+QUAOWGc3LiiEeBPQ22
 I+V28GNMeg3asHNOTG//5+twPY+Ab1QEW5S/TKSBzsICpeuRujK2XiKqnwhvswkeVtQB
 z3Cmd8OoYpK4hkNx5xIqwdM/DFjcjAXo99mF9zmoanbRAOOyZ+j3CgVrJK1WQRrHlgmE
 I1H+jSFePhc9LfmUnXnh3gw7YqUHqjD5notcOe+C1J0/gIVimvZyW+aMnqSj2P8P9Iy9
 0DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w8f6R9ASZrt/RtlltLDdWpOWT0IDLH/5n6K11WS2PRg=;
 b=TTvS5F/o9vU1vYD8mhSzaonDIyL0Qt3DGYdioZ6RjBEbfSUnxjck4991KtwNMxqI4q
 sroocAGy02HcDKyf107iW8JA1OhZXfgc+96C/h2rdD5MXCWFIdlVlASEDIyy+OubaVDD
 z9qJagXK4mzwsiO82XtX02CLXGp9pyhryQMEbYiJU6zBEAdPaPYD8+K/npZ6PTzbTts7
 Na5rABGLoqQkL8LnLCx/vcVtD7irXndfdwihsOnLXDzAiEKUMHRcq4J7IPnpIHJbH0/t
 kK+xaTkK6XQTLKfVApNX0VHER9d1n7yDXkO6qxmN3PtOH7HKGQ1BrnJu6Ey7fdNf6Ois
 zmYg==
X-Gm-Message-State: AOAM532o0DmVCxZPa/k3foFJ39ne0TZDH1sSupWqcwHyzBqcuGl9oIn7
 U0CJZbgFzaJtQIPzshLfd0qCHw==
X-Received: by 2002:a62:7bcd:: with SMTP id w196mr4116737pfc.73.1592496764044; 
 Thu, 18 Jun 2020 09:12:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x77sm3468469pfc.4.2020.06.18.09.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 09:12:43 -0700 (PDT)
Subject: Re: [PATCH v7 10/42] target/arm: Implement the ADDG, SUBG instructions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-11-richard.henderson@linaro.org>
 <CAFEAcA-QZ_D1tQMv785xsxWwcEKmM76dK4Mvgx=y7eyb_mUqEg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3b1b50b8-061e-8422-2df0-e8df6f856941@linaro.org>
Date: Thu, 18 Jun 2020 09:12:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-QZ_D1tQMv785xsxWwcEKmM76dK4Mvgx=y7eyb_mUqEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3nZ/mcWTHCew

On 6/18/20 6:17 AM, Peter Maydell wrote:
>> +        imm = (imm >> 6) << LOG2_TAG_GRANULE;
...
>> +            TCGv_i32 tag_offset = tcg_const_i32(imm & 15);
...
> Given that we don't really share any of the codegen with the
> existing disas_add_sub_imm() insns, and the insn format isn't
> the same (uimm6/op3/uimm4 rather than an imm12), I'm tempted
> to suggest we should structure this the same way the Arm ARM
> decode tables do, where "Add/subtract (immediate, with tags)"
> is a separate subtable from "Add/subtract (immediate)": so
> instead of disas_data_proc_imm() sending both case
> 0x22 and 0x23 to disas_add_sub_imm(), it would send 0x23
> to a new disas_add_sub_tag().

I'll do that, because...

> But this patch is functionally correct...

... I've just noticed that it isn't correct.

I drop the low 6 bits of the 12-bit "imm" on the first line, and then try to
read the low 4 bits on the second line.

Oops.

r~
