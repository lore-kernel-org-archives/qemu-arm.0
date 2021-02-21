Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1113090lfc;
        Sun, 21 Feb 2021 08:38:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysz4gRJrYdGdIsudT4hzm+HB61Wg2E7IjOrlW/o50doE0r7HHd8b0Pe2j3M6ZDec0d2A6w
X-Received: by 2002:a25:50d5:: with SMTP id e204mr26694180ybb.294.1613925517937;
        Sun, 21 Feb 2021 08:38:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613925517; cv=none;
        d=google.com; s=arc-20160816;
        b=e4NCtpWhklLdutINwDnE/ZheWVciBPAkjO7FXZ/9UEjf4WmlPvmOuuNYLK82WfAtPM
         1mjHCNDxKzXnQlpzZgnB0AdQJxSiBChtoZ4pGSV6omoe0+g3vu6d5JS6dc/hou6jI8vX
         5LQHhgkjT0E8f3e73wLN/2H4SzLltCvd2MGHyeAjR/AF0Z3AyVWzbsM1FgrLEGduJV9N
         C2xIpmCtVQXk4V7ZPiU0QAYju+cnkfxB91mm7NLY72DEqJvoNdc0bmbhyINbcKZeZDDs
         GYga0FO8nXBCb2MMUfT9KXMl2Jst4ZdX2ZWpC6JolWyrK3+vSo3dvhU7LJK+bzvWV5rV
         MNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3YjKPhX0oflBmINtMtknp5iw/TvXXLniGcuPPnFL7vk=;
        b=PoRoPJ2zIEDSiylO8q0vh9gT+8R7OQ/ycQ4aP+FDn4nmD09rZ9fCZhaYzr8tUPLP3e
         WtVhMBonJ/Y5xmDXW5a/30ehLhJ3LOgZDIV6Hg7fy5GXAJYb0vd8KoZz/pBJzyAPiKIc
         fnmUWLmUeMykztrRzrcMJdvJXMH72Kp0DcMh/k85u+lzOjNw8FlPr9ox6QeWWdLxhw1J
         iOQRPwb0b36evVpUn2MCoJcm4U3YcVGTvSvescm5Gf9LFvLYFQB9Wxiqaie2E9pFjuDQ
         PyGENAtj/chiXHy2Xw52KirMmJnmAucST+Wjg63LTn+morkAs9p96SfbOoUyHtn6fEK6
         GsoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AllwdyD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si18065894ybc.378.2021.02.21.08.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 08:38:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AllwdyD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDrkj-0008AZ-6C
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 11:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDrkD-0008AB-Kl; Sun, 21 Feb 2021 11:38:06 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:46962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDrkC-0007vL-1O; Sun, 21 Feb 2021 11:38:05 -0500
Received: by mail-il1-x131.google.com with SMTP id m20so8788930ilj.13;
 Sun, 21 Feb 2021 08:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3YjKPhX0oflBmINtMtknp5iw/TvXXLniGcuPPnFL7vk=;
 b=AllwdyD6T01TKU/PslJJlx0zlQKerNq25C/FKpxHiEIwBxjo1KalwUuD1vugz6xUWi
 9dom/0qewXJM+ybWTw401zDFV/Ohz5P8O1ipNO1vuHsr5j0vODSgMf2qXcRSg+YI3r+H
 BuBpxowWbFZz8k3TC9ssixhUq6u9I01DfuScQi2eS7EGJtMZ6q44BKjiA68MOYVD8zAl
 9vAqZQvAORRTo+pA5bpp0jfaB7fqYtyx+00X1S4D02p3gzhlgLNnzcut9bJUy29mGAYo
 HMCUMhCVPM5jjf6ov418Hue+N8eR7U5TrO+7V+4FzNL8qvCnjEHYPyOyIsIgobyNmhsf
 Thig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3YjKPhX0oflBmINtMtknp5iw/TvXXLniGcuPPnFL7vk=;
 b=Np56EC/Qn4vbRcWnVXeBS9md8vYewXLiSM3CGzEqjiUoFnV+q4t9SLlzE6mLu9/vR9
 oqWhFZ5Pd5fbuSucJffZzwhyF/pqwemkL1u5TmlwvykX42BTSU7V58nHvFiWVXmoJnnP
 zhEk4zsjuObJXTYd8UGSiotIguTIT/JvUV4Kt3CBIiFDjDeQZGZ4uJmrn0vqP1hoa6B6
 fgsf/uTHnYtj5ckIy1gdsSYiMPtQX59eClL0pzx+5xqajIXZR8I7sBllM4/v0ObtTWvi
 OWj4p7KZQt6jK1i5F+F8z36SkCKwgI8eXD4NNUmZKTKurvYohwcXhtq9OlydaXRhKyK6
 EC/A==
X-Gm-Message-State: AOAM530t03si8I3Sr78YYBngnYVv109GT8WaTERPyJuOORzAP5bv6YJb
 ZYgBkHPVjHEIbB9+8QRxA3VspXOuD4kOZwnX
X-Received: by 2002:a92:c8cd:: with SMTP id c13mr1714662ilq.238.1613925481329; 
 Sun, 21 Feb 2021 08:38:01 -0800 (PST)
Received: from [192.168.88.57] (c-67-177-215-41.hsd1.co.comcast.net.
 [67.177.215.41])
 by smtp.gmail.com with ESMTPSA id g11sm11402181iom.23.2021.02.21.08.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 08:38:00 -0800 (PST)
Subject: Re: [PATCH] hw/char/pl011: fix receiving multiple chars
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210221150430.6223-1-zpmarvel@gmail.com>
 <CAFEAcA8BB=ka9nPv9-okHhHwXOAbfbaXs9OFn4bNkbU+b-H+FQ@mail.gmail.com>
From: Zack Marvel <zpmarvel@gmail.com>
Message-ID: <293978ea-bb78-066e-dbe8-f93b2165d28d@gmail.com>
Date: Sun, 21 Feb 2021 09:37:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8BB=ka9nPv9-okHhHwXOAbfbaXs9OFn4bNkbU+b-H+FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=zpmarvel@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LRe0eZkp/XlU

Peter,

Thanks for the quick review. You're right, I misunderstood the API and 
the bug is in ui/gtk.c.

Thanks,
Zack M

On 2/21/21 8:19 AM, Peter Maydell wrote:
> On Sun, 21 Feb 2021 at 15:04, Zack Marvel <zpmarvel@gmail.com> wrote:
>>
>> When using the GTK UI with libvte, multicharacter keystrokes are not
>> sent correctly (such as arrow keys). This is not an issue for e.g. the
>> SDL UI because qemu_chr_be_write is called with len=1 for each character
>> (SDL sends more than once keystroke).
>>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1407808
>>
>> Signed-off-by: Zack Marvel <zpmarvel@gmail.com>
> 
>> @@ -300,7 +300,9 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
>>
>>   static void pl011_receive(void *opaque, const uint8_t *buf, int size)
>>   {
>> -    pl011_put_fifo(opaque, *buf);
>> +    for (int i = 0; i < size; i++) {
>> +        pl011_put_fifo(opaque, buf[i]);
>> +    }
>>   }
> 
> I think this is a bug in whatever is on the other end
> of the chardev connection. The pl011 can_receive routine
> only ever returns 0 or 1, so it is an error for the
> code calling its receive function to ever pass a
> size that is greater than 1.
> 
> thanks
> -- PMM
> 
