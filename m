Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3243873lfa;
        Mon, 26 Oct 2020 15:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmmTmNy8HWXFtTFUMfmMy3yiIGvgafiRCNgXCeQkdyzqt6e61UWTjSjoPEjzU2NxFKSwJf
X-Received: by 2002:a05:6102:2f8:: with SMTP id j24mr11334676vsj.13.1603749792532;
        Mon, 26 Oct 2020 15:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603749792; cv=none;
        d=google.com; s=arc-20160816;
        b=umG/E1VVCO0aMme14f+2ymuitvoSgUtOM/7vNmF0la567a/CmQtYvvbYn9axztP+tE
         xOdrolSddJskASzf5QfTxZ10S7+YixOlCzeQE9/HVhMoEfgVPM1W2JU+IAIS5+sBW1EH
         Tg/9OguZ/+NKroOhN2e0w9YFhLqPqJQrxI1bnHvytIOOaNLYK2AEC15RONfI8nHN26QU
         U9AakIceUMkU6t296cxj0h2C5rnt8Pn66caj4hYWoBuOeFGnmiCxX2WVux8UlctwyIMG
         3aLlIFNNTqeZXMtmYlSzMHGxKYPzKYoYNOb+t0+53FyG0YRV5/AYbpkGX9YDmQiM/Jxr
         oMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=n0tlhVdX1PhjRYFZ92xhEDk7iPK7lfHviWK3te11jPw=;
        b=Dm0QaMri/yBDhUEhoZlsrhWTyTDc+gcImy5t9fsXzgCa9dR8kaivjx+MS488GsCAnr
         5BKqGSTd1AqpL46qeNhnbQDZGvBN2wduJRpArA0nu37Y7Yc1gQpAmwwDAVMBXc2esZmW
         mss/OyYE+eI8LeMLorQAxwE6nT+Mgzh/cWZAPfUoo9qPApLPz6VcuL+cergfP5MRw9dQ
         HdE9Zv7LoaZWHTtNnHqUU31nHU+YngbBoDNoQA/1Jn/z5UMCe0fW70muhuqI37wreCvQ
         oRnFaFtsxA5Sr2DCnmSqdh+yBSThMws9XtzTej8zQ6HgduK0cIz8v7v029YsFWLC05GI
         rcYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EXjwvwCu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si1177977uam.211.2020.10.26.15.03.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 15:03:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EXjwvwCu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXAa7-0004UH-SD
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 18:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXAJ4-0006Sp-3G
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 17:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXAJ2-0002bT-Jz
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 17:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603748725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0tlhVdX1PhjRYFZ92xhEDk7iPK7lfHviWK3te11jPw=;
 b=EXjwvwCu3pfIoW3AJ6xezhux705J6YFlOAQlsu6i7NL0BL1/NfIu7d5pbJi5dvkZSLmlF6
 BiqZhR5Ie7eJ88EEzHBpKvc1bv6q5f2YdUXS8ZNIdUAkZNn6kQlgPHPpbEKrAPlKx7I2S9
 dSA76zRAqG9wCMnucezsTvr6qtEKADA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-hx3d7nV5P_S33HPPu37ADA-1; Mon, 26 Oct 2020 17:45:23 -0400
X-MC-Unique: hx3d7nV5P_S33HPPu37ADA-1
Received: by mail-ej1-f70.google.com with SMTP id lf18so6378558ejb.13
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 14:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n0tlhVdX1PhjRYFZ92xhEDk7iPK7lfHviWK3te11jPw=;
 b=m2F3puQI6+IieM+psFJhXjNhNPeBzyGrE+2R3SwnIUvwdx5tfkR2ztDveeVrx6kmTK
 41ONkXLxTWxyYH0KNIr+ddFpTICMfKmuQOM0eD6/ZyeTKbpGNYtuu3KoohPyBcZxLbf8
 SnQ73yh9UYz3w20BNMDQiotLvWVkiGjpOqbeJhI2bn8Dq4mbcqVp//tFeRJaclh1MgQx
 fWW1CmU8V4VQxE6b4EranGohsZs6CiY+WShZwJAEl1b29oH0LYpqmJ/dGPIIt85f7CP/
 iefKltYdfI3ddQ9Fdb+HcN9xEgC70KesQHjadb4U99Yaz44lXOOXQtJMfqrrZnmZvTGC
 3NYA==
X-Gm-Message-State: AOAM5312RGjarm9kF6IMnZq4vmhO98WSVlTBsL40OSc6BH48/6gAucsD
 26iAPLKJXUZB89xfhqJwHaU8Ly2blKB7uWT0I/a9AEMCWNyZey6t2gz9l4gDPb55og+h1y3bbYg
 IorSu5QEVuexLenQ=
X-Received: by 2002:a50:871d:: with SMTP id i29mr18105682edb.300.1603748721755; 
 Mon, 26 Oct 2020 14:45:21 -0700 (PDT)
X-Received: by 2002:a50:871d:: with SMTP id i29mr18105665edb.300.1603748721552; 
 Mon, 26 Oct 2020 14:45:21 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id e17sm6620921ejh.64.2020.10.26.14.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 14:45:20 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/core/ptimer: Support ptimer being disabled by
 timer callback
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201015151829.14656-1-peter.maydell@linaro.org>
 <20201015151829.14656-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f0c605d-0aea-a7ea-a3da-4db09759527d@redhat.com>
Date: Mon, 26 Oct 2020 22:45:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201015151829.14656-2-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCDPNk1wYCBy

On 10/15/20 5:18 PM, Peter Maydell wrote:
> In ptimer_reload(), we call the callback function provided by the
> timer device that is using the ptimer.  This callback might disable
> the ptimer.  The code mostly handles this correctly, except that
> we'll still print the warning about "Timer with delta zero,
> disabling" if the now-disabled timer happened to be set such that it
> would fire again immediately if it were enabled (eg because the
> limit/reload value is zero).
> 
> Suppress the spurious warning message and the unnecessary
> repeat-deletion of the underlying timer in this case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/core/ptimer.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

