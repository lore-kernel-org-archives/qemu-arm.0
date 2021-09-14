Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp834735lfp;
        Tue, 14 Sep 2021 09:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIroFg+2fEZEKvEyiE9Ki4pOYHZfHl9lHr7JFwsbDWYX2H4N5yMP/ZfS94S4DMsk4MwkOg
X-Received: by 2002:aa7:cd96:: with SMTP id x22mr20067959edv.46.1631636302533;
        Tue, 14 Sep 2021 09:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631636302; cv=none;
        d=google.com; s=arc-20160816;
        b=LNZm3YR4pMCO6niNjIGrxa4T2dYT1gikaR2DWg8jI36m7ZGuTKzDBgP4wrt7uF67ca
         vt3WqJ2y9A/Jc08Z7edppCLxy3XRXht2OC7eeIsomr4Jta3UedECnGj7Rik7+dykVOXx
         rk4E+u+F0li/PVXAqoHs+I+JpWBWT1CuWbZjyTZcZikUoPuHsRyYPcFCw/SbZ3Lbcb0L
         h0V/Zu4XQTv6SwEKsiwQ64VAMuPX2vkUxTLj29gL/+yIuGHEMu7kWyC1OwBfCp1Zl4O/
         vUafrgmldf3ptxEGSzL7qdbmhxeG4es34iyR4mZqGzBSOSO0hXFGjbjVWpA4huGM0zda
         GXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fwSgd185T8jrnRcPRkYx6E8h8fWkH+f8/s0umRpbj/o=;
        b=iN4x8hvfrmhTXwe/c46ooGdaqFV9YENk0gpvZ911W/mPBoJqgMW/xc09I9Dt7lRyjc
         AFnC7runwL+fGRoaQ6hdyRy3R8hQN6vnAwcyTG79wSYIA8fOlFCTYqpGiLNfB4q7l2FR
         5FlZU0gWyD52S9F1MialxyIm6gKLSXTK+3jhnVrhxyfpu3QTKuk2M67cLuCGvWhp/TYT
         phVyJjnu26E31dUJ5hg8EreSodXMvi/eZvbcSYL0xQ/LAY8MycW1L1dQuKI/J0rcpDqn
         34T2L6cFF0koRSJwmFjng6T7p9q0yw8dDk06JoM9rKawOvXx9jm2UqV0rtevEWs2rZFP
         TWIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KrSd0f6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21si5122779ejk.714.2021.09.14.09.18.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 09:18:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KrSd0f6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQB8X-0000vc-GV
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 12:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAvZ-0003Mv-NX
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 12:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAvX-000531-MC
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 12:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631635494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwSgd185T8jrnRcPRkYx6E8h8fWkH+f8/s0umRpbj/o=;
 b=KrSd0f6jE2tpywIRe4J1WsD6MFNnoU2q8OwVZto51Nf6CO8VGdfbPnj+hwEFzl4HQ3cw85
 yNVY7nSNtJZGQ1oWJvFe488lZ+ZgVvY0hDzLEmDTER7p5qHWeoDyJMZegaLqqFU66hud+u
 derxa8bZLBLIaUWtrIgdW2fLzVTq598=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-IKJppgaeNx2RwYNF3KcNRA-1; Tue, 14 Sep 2021 12:04:53 -0400
X-MC-Unique: IKJppgaeNx2RwYNF3KcNRA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso4140643wrw.13
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 09:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fwSgd185T8jrnRcPRkYx6E8h8fWkH+f8/s0umRpbj/o=;
 b=ODlnFtWkG2tLqwgyO9zee6v4WNdYQZ4+iOGye4Zq5MLBXSmPsZkfk1AyX/XjQ/AVSt
 lItnFAXW8DnygWIn7mkpL472ljAI8vzey9gpFRb/KMuyJ81iBS2NiWq4dDJDYWDmf+Se
 WIWM7N6x0HrmwtrQ97RvYTWQcqPvWB+vzkTHsu7CeTjy70gdsT8J/SCadsTgjR9IJFae
 P7pt2uuocnGtmje/teaX/2hPvpm4zqbel15wvXJwdt5SumD/TOz2Xi7ejkQboEcIBvuM
 asEoU+7YthRYsXI3Ac9qqkuMt64ZnKiJlKziFT4/cAvmvJcJyT5mJuGQVFK0c+XvMTMB
 xHKA==
X-Gm-Message-State: AOAM532dmgWKuhnYnparC9c3NE14xvce5p5LMvtOUbSCtMujusyej9MQ
 bRjZx/S453P1ugjVQZXEFTm3mTtQlrv8tTX1yaCg9GRCG0DqMzxT2SL10G2R/1SyPMAHqt83xCX
 UsLE2atGdIn5o
X-Received: by 2002:a5d:630a:: with SMTP id i10mr13306064wru.178.1631635492447; 
 Tue, 14 Sep 2021 09:04:52 -0700 (PDT)
X-Received: by 2002:a5d:630a:: with SMTP id i10mr13306025wru.178.1631635492254; 
 Tue, 14 Sep 2021 09:04:52 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id q7sm5175176wru.56.2021.09.14.09.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 09:04:51 -0700 (PDT)
Subject: Re: [PATCH v2 30/53] qapi: introduce x-query-roms QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-31-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <342ccd00-7210-1169-fb9d-3fad8d3c3470@redhat.com>
Date: Tue, 14 Sep 2021 18:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-31-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o1Slyq8lTB0C

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info roms" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/loader.c  | 55 ++++++++++++++++++++++++++++++++---------------
>  qapi/machine.json | 12 +++++++++++
>  2 files changed, 50 insertions(+), 17 deletions(-)

> -void hmp_info_roms(Monitor *mon, const QDict *qdict)
> +HumanReadableText *qmp_x_query_roms(Error **errp)
>  {
>      Rom *rom;
> +    g_autoptr(GString) buf = g_string_new("");
> +    HumanReadableText *ret;
>  
>      QTAILQ_FOREACH(rom, &roms, next) {
>          if (rom->mr) {
> -            monitor_printf(mon, "%s"
> -                           " size=0x%06zx name=\"%s\"\n",
> -                           memory_region_name(rom->mr),
> -                           rom->romsize,
> -                           rom->name);
> +            g_string_append_printf(buf, "%s"
> +                                   " size=0x%06zx name=\"%s\"\n",
> +                                   memory_region_name(rom->mr),
> +                                   rom->romsize,
> +                                   rom->name);
>          } else if (!rom->fw_file) {
> -            monitor_printf(mon, "addr=" TARGET_FMT_plx
> -                           " size=0x%06zx mem=%s name=\"%s\"\n",
> -                           rom->addr, rom->romsize,
> -                           rom->isrom ? "rom" : "ram",
> -                           rom->name);
> +            g_string_append_printf(buf, "addr=" TARGET_FMT_plx
> +                                   " size=0x%06zx mem=%s name=\"%s\"\n",
> +                                   rom->addr, rom->romsize,
> +                                   rom->isrom ? "rom" : "ram",
> +                                   rom->name);
>          } else {
> -            monitor_printf(mon, "fw=%s/%s"
> -                           " size=0x%06zx name=\"%s\"\n",
> -                           rom->fw_dir,
> -                           rom->fw_file,
> -                           rom->romsize,
> -                           rom->name);
> +            g_string_append_printf(buf, "fw=%s/%s"
> +                                   " size=0x%06zx name=\"%s\"\n",
> +                                   rom->fw_dir,
> +                                   rom->fw_file,
> +                                   rom->romsize,
> +                                   rom->name);
>          }
>      }
> +
> +    ret = g_new0(HumanReadableText, 1);
> +    ret->human_readable_text = g_steal_pointer(&buf->str);
> +    return ret;
> +}

Is it possible to have an helper in 'qapi/qmp/smth.h' such:

HumanReadableText *qmp_human_readable_text_new(GString **pbuf)
{
    HumanReadableText *ret = g_new0(HumanReadableText, 1);

    ret->human_readable_text = g_steal_pointer(pbuf);

    return ret;
}

?

