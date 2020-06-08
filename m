Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5285038lfc;
        Mon, 8 Jun 2020 10:48:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcyPxWF0RHFdDxQgs6B5pG2ofOJicK+QcpOZ7cg441ubWH1JEZPFxqChnPpbTCLxoShsQG
X-Received: by 2002:a25:f206:: with SMTP id i6mr40190514ybe.415.1591638531729;
        Mon, 08 Jun 2020 10:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591638531; cv=none;
        d=google.com; s=arc-20160816;
        b=EGYAvGsnsrYrzDr4DQimjTrr5aEWUJcckTydwiu36wtjcz1YlJ0/E4zShFIHso2Cn1
         AIvov3zNHkTetAJv7/6Np8g77VQOubufSBXbI54yB+h0hqXLx2SkryOpxOTxPp+QnuLR
         NDi8xkHHtoX7Wl3WLev1ryQoyJM7zhvXOZ5CEjRL1WRcdZmddawNNFZ3qusqLfpS9nzf
         YSd3djLwli8977bH2HX3oCR9jR6TiW4+11j7o39mamwTkG8gJ3HCP8CYTTMzOpYi5ecR
         9TRXLXt3xXzfUXBkOj6YXxjin7UsZFKKrS+jQMiwsR5eF4zba44O/vNhfqe3uo/7ErFc
         94SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=RA7Qd/e5WmDCYilM5DXtSv9b2bjfckDER4ZIDZrQRWk=;
        b=Jh5BVPJyQQVhqjjiCPirnvi4M0unW0AJswF+qP+RXWZ7qtQXcGRMWSJMwQ2AaZ1sB1
         JvCAc5egK/6HaEin1VoyX7kBXFm08c3MPXluHi7n/LJJc65fS9wbwu0+Ea6iXu96n+qk
         AgQ5AJ+vux0RiC9SWt8a8rqPF8/KxdLKEjvzbuHE1XH6+eKncr2UX9ETZaobNuiLrdmb
         2WCTgnC+vZG7RsDuZOOQuQ7VJN/7H7jSf9ZjZF7U+W/Wsp1kg7qEKGFP8NnGYUpDfCJt
         0OsJmwRXq18ZLjr7oRUQxoeDFJwTZmE97nPPliIUH3aqpHB0kQy5PG3jPo42mCZTp8Ci
         kdIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VSMxYU6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si258473ybf.91.2020.06.08.10.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 10:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VSMxYU6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiLtD-0000Uk-47
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 13:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiLt2-0000U4-E0
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 13:48:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28813
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiLt0-00026x-9B
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 13:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591638516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RA7Qd/e5WmDCYilM5DXtSv9b2bjfckDER4ZIDZrQRWk=;
 b=VSMxYU6HWKWEgB7uyjZ4UNYsNE/+WmDUnNXlwmTji95gk/xKBXpudKKs+CK6OV0/yJ1ljO
 lwBJwQ11dXqe7O8UoxLTMdCgnh93dqbP9dfxd5Mt1Bz9hqtM6CjUMiLZbV4gHcUDnVBNfj
 Bm/RrpUDznjiZW9jh4FUGsuqbVngNlE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-Tc3a70u2OzmOnXJa8Roajg-1; Mon, 08 Jun 2020 13:48:33 -0400
X-MC-Unique: Tc3a70u2OzmOnXJa8Roajg-1
Received: by mail-wr1-f69.google.com with SMTP id m14so7455617wrj.12
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 10:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RA7Qd/e5WmDCYilM5DXtSv9b2bjfckDER4ZIDZrQRWk=;
 b=ajkbkeFbw/yxi5tv7zqZp4GiHTWpbe7Lszs0dh2xd2Ly8fTHGaS+Bx4Lk+OBZ35rG3
 OMzYAUNOmhH9jsNzB5oCW5/iOyJq0Ri2HT4q/HQq/xHxe2CXifCskgB8qXME9HwKacXe
 gtBFpmBPOq3E6/hLWFjd43spaAT+20qIhVfMY/yUnyqJGwydV+ifpMuffv6yndsaoNP1
 XrJqT4L7T1qAIFWXmlCSfDQ2YdrlpYwDNAYugqxFLmcMg3I3YenUckwvWvRLHDQOSZKd
 y2Cq4uiQhiQje/RAX+aFpHfjC5FpBLabph/UBSQXJKRtXoANTZceETOYj2IyUO71cPC0
 hjfg==
X-Gm-Message-State: AOAM530gJVqFlKOycir8yiOM7a0cf7qcySl/pQ+u5i/N1OPVKNaPMPUk
 4IRUKv6uXVdmqPtbwWML2Isr64qvJvTR6qAL9oQiSS0L02YJF333jOQyGlq22XNC0HbAhi/dspZ
 8L8CLG66Ydl3o
X-Received: by 2002:adf:a350:: with SMTP id d16mr25551665wrb.237.1591638511744; 
 Mon, 08 Jun 2020 10:48:31 -0700 (PDT)
X-Received: by 2002:adf:a350:: with SMTP id d16mr25551649wrb.237.1591638511470; 
 Mon, 08 Jun 2020 10:48:31 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id y80sm252772wmc.34.2020.06.08.10.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 10:48:30 -0700 (PDT)
Subject: Re: [PATCH v3 00/11] hw/sd/sdcard: Fix CVE-2020-13253 & cleanups
To: qemu-devel@nongnu.org
References: <20200605102230.21493-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <7a456fdc-eb53-063b-1d5e-24472b4057d5@redhat.com>
Date: Mon, 8 Jun 2020 19:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200605102230.21493-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Jj277shAefn

Hi Alistair,

On 6/5/20 12:22 PM, Philippe Mathieu-Daudé wrote:
> Patches 2 & 3 fix CVE-2020-13253.
> The rest are (accumulated) cleanups.
> 
> Supersedes: <20200604182502.24228-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (11):
>   MAINTAINERS: Cc qemu-block mailing list
>   hw/sd/sdcard: Update coding style to make checkpatch.pl happy
>   hw/sd/sdcard: Do not switch to ReceivingData if address is invalid
>   hw/sd/sdcard: Restrict Class 6 commands to SCSD cards
>   hw/sd/sdcard: Update the SDState documentation
>   hw/sd/sdcard: Simplify cmd_valid_while_locked()
>   hw/sd/sdcard: Constify sd_crc*()'s message argument
>   hw/sd/sdcard: Make iolen unsigned
>   hw/sd/sdcard: Correctly display the command name in trace events
>   hw/sd/sdcard: Display offset in read/write_data() trace events
>   hw/sd/sdcard: Simplify realize() a bit

I forgot to Cc you.

Since you already reviewed a bunch of SD patches in the
past, do you mind having a look a this series? It should
be quite trivial.

Thanks!

Phil.

