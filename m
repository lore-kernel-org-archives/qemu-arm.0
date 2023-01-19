Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp228395ejc;
        Thu, 19 Jan 2023 02:37:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMiPECiTJvyu8gdYCJJf5xmdY605JX4EKUBqKpinrmMrBRf074X2G1LOfNr4K2qmZULTgn
X-Received: by 2002:adf:f790:0:b0:2bd:ebc0:6f79 with SMTP id q16-20020adff790000000b002bdebc06f79mr9550002wrp.46.1674124637193;
        Thu, 19 Jan 2023 02:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674124637; cv=none;
        d=google.com; s=arc-20160816;
        b=0pVnXAnFqlFR/5QO27eJMAQlbrEYY6tZHRmOtKzomoADWZLIN+ZHvCF7Vm4mCM+v2w
         mcai1FKKGnGF9fNEN3J5H29VVi95pe3vkvum8U74dam13FpMvHos6+qZhVCx7x8i0ot8
         LKPcYpeaIQYODLAYOuXm0rz8BP9N7A9n1bIdauTn55cpJKsOqJP5nlpL0ZGOuEFCRqyK
         tC4u5cxHEBKorRXU2JbUxuN3gGOS5jS90Msij8axg1feOVno/9XIX/sswuF+BQdJV/Xl
         mwht+OZMFAT+3qV9SE91RXUc2dDIIYKQNf56DNxrxRafI6VBBEg8bxpgCVOElXUXLiHS
         2alQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Xe+FM7cXimnUn4oH5URYtU7uJViNTMtrQeAopCdTP+M=;
        b=nxCG6N5+n9kpp8pyLNpNHxtZVZsbRp4JoezYphmmgsWaL7JAg4JJg3+npDY4mAcCCa
         r7CkkiVQffiZhUsxSx9XtVdNhbt04C5r5a7+AlqHwqVIrDNzgTcA+zXS1ZWr2f3pkoep
         XHG7eBUMEyt4wGj+HYDcodO71gMzHG3yHLhr8iaQwnI98/ANoGLLDBlWiDMJPzundCbW
         oEvUujWlvdJOd6mPLYpgUQyXBW02xMlx4reWQvnS7RGbDohKl3AlILLiBwtJMroIRnRS
         0aTO4SAuE5MDiW0oF9IP2S11a9A3YNoguk5aXLrtwGudDWEiOhvLhSswY4XAPE3sHp4y
         2ycA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QoqxjrPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a5d6152000000b0027219ea23d6si29679394wrt.277.2023.01.19.02.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QoqxjrPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pISI4-000832-EL; Thu, 19 Jan 2023 05:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISHi-0007vB-K2
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:36:44 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISHg-0003TX-Ll
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:36:42 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so912798wmc.1
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 02:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xe+FM7cXimnUn4oH5URYtU7uJViNTMtrQeAopCdTP+M=;
 b=QoqxjrPCt4AFW4X71P1UMzTxpSgHGH5DyI/tNSaxNlpxnNQBmDlNTw/VMjR6Llm9+Z
 HSmRzqvrMAadjAwcW5JBGMgpxEaPI97bxlqkyBBnVhsJe6RuLV5iLzL2mos7QQ/ShQYI
 3IUJLR33t3WBjAVwxxEFt2J2TqeqC0a1XD5Fl7k1Hs/FRPLf0+zla+W8RSTgdT2WjHZQ
 uOZ/l++9ajlTFdlszV/6qhudRS1v1Wg2aX+fmG2169pl6JJh3gD3OGy85QRrExUwbchd
 LzwTUo4LQPLiaGQXrbqjX0K8Q/sleSALDmIrJQT+n8v6Gow4YMYIpD86mBdFI3e+PbkX
 P8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xe+FM7cXimnUn4oH5URYtU7uJViNTMtrQeAopCdTP+M=;
 b=q25gTq5afdO/2NtY+M+ZzFRsmDHyIFOLJ9iBGN3o5CL9uqBYfR6YHDFhyXCk1CLCaW
 bik7Ek0I3yxMrRpx6X2JXS2tVdWKbDsZGOscan8VkuLiQd2llq/4UsStZ5OMnowSIWwU
 YBf/X1uWLjCrIUwmKK9Xsj4VS0EcEpnvwCbp+X0QOHepAv/UnATgIfM/85q++cahvRhA
 4B7UGz5krpJt/0SzkHz5TwSa2Z0Ad0g6Ee/4NMbY3f+Q5H/fLrCBYkBZW1LuV+JqxLAg
 bnBpDXDdED1deiHI3t3uYb0+YfvZ1X1UlJnnrlkZUXT6mA5RohwwOGybmE5pk6rCLp7d
 6vuQ==
X-Gm-Message-State: AFqh2kr0TmVt3/43xb0iHiIKSzAD2R2FdN8WqQ4rIf0DVjXG8Kz01X5V
 rtI42wupjICy5ZDmc02UVQy2Gw==
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr9476856wmb.0.1674124598398; 
 Thu, 19 Jan 2023 02:36:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003c21ba7d7d6sm1030996wmo.44.2023.01.19.02.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:36:37 -0800 (PST)
Message-ID: <823c1832-b165-f3a3-75a6-ff8de387dbb0@linaro.org>
Date: Thu, 19 Jan 2023 11:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 15/19] accel: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-16-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-16-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XAYdrn6fPYpl

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/sysemu/accel-blocker.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

