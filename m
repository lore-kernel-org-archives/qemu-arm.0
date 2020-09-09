Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp225551lfq;
        Wed, 9 Sep 2020 01:25:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcyMwwMYsa8PHJQHMj0DqjkF7NA4SciRFeCJKyOVVtbTJXK3qmpUvZsEwaV/ptB2VzKN7C
X-Received: by 2002:a25:84d0:: with SMTP id x16mr4301690ybm.105.1599639926006;
        Wed, 09 Sep 2020 01:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599639926; cv=none;
        d=google.com; s=arc-20160816;
        b=f+R+Nz7rIDH80MCUVEToInub7Lk3zsHLyv+mvWNG9x0xdmHkItLWbhMfJ7YzcwVYnX
         zLmVoVeKTrqtZ7d77X9A4D96tRmtqsbKsANRu1ZQig9kgaBzYuliZBbRpybAYaAIFwu4
         Bhv+7RiiS58cxx46gWP2iN/2h7gyvNWdcj5IEHk2UzPVphInu6g798RPgjZ6yymQZsdq
         5DYbUImRYb5vRI+PASObWB//4n0BB271evRhfP1d3rUp8t7hP8f7HfhDBl3V4LlG9dr1
         Yb5fwSoeNwan2zFkJ0JBmkJyBQBrI8IQu9PVN/L+eVqGwlefF3sOl4BRMTkaTHb04z02
         Ke9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:date:message-id
         :from:references:to:subject:dkim-signature;
        bh=ppkK1Wya5ZQMzD1XRh5Xg04WmPCCNOXjT8xtlOy+v/E=;
        b=FG/Z5wVPPTtJGW9Fw28o78lZzUDPB1phpYbXmcV7cANDUPgde+MKobybUB1kNPYJ/Z
         n6D2CK8jHgk45PLF65xMkcPIur30ueFE2Ykahcbd77PQU1a5jNAKrH4IFjXF9xBpwaUx
         Q4jFTZZnG4zB/AaB5GXk7gNRFqmkSoAr8CFrsJB1U4pB6JpzqQROCaAh7RX56WL0LtAE
         8MhqkYp712PEX7URWApvpPdqEmtZkADOBQbbCaUul3OCrLnA1dwfiaIfg/AGF3frSQD6
         V4/6ekiZ/qqSdFUrq5FGJbuEud9dtQN4QiXzwTEgrqmS/F+u/s3kjCEZcPJjEbHNcJqE
         yQpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ffyuMqPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si2395776ybk.34.2020.09.09.01.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 01:25:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ffyuMqPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFvPx-0003hX-AJ
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 04:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFvPR-0003Vi-Gh
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 04:24:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46848
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFvPP-0004un-NC
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 04:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599639891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppkK1Wya5ZQMzD1XRh5Xg04WmPCCNOXjT8xtlOy+v/E=;
 b=ffyuMqPqRfclK7dLdRh4xbKNAsN3P8p4qcQODFd7bXdki6Hp+fNoidF3PdcPHFJ8J/gGsC
 F9VBLBB5xwXHfbiWqteB2n0HLuxclUtGg7jD8l4uj2IBBHt8kj/fg8ftsGxOj0yF53pqjk
 9ExT64lL64L9HS8FGoV1GiVdduzoxb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-yW6RkQsXOSW18PT-9o8wUA-1; Wed, 09 Sep 2020 04:24:49 -0400
X-MC-Unique: yW6RkQsXOSW18PT-9o8wUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57C73800050;
 Wed,  9 Sep 2020 08:24:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-82.ams2.redhat.com
 [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EC8E5C5AF;
 Wed,  9 Sep 2020 08:24:42 +0000 (UTC)
Subject: Re: [PATCH 1/5] hw/smbios: support loading OEM strings values from a
 file
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-2-berrange@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e5c91a17-bf58-5741-c10d-338426ade3b9@redhat.com>
Date: Wed, 9 Sep 2020 10:24:41 +0200
MIME-Version: 1.0
In-Reply-To: <20200908165438.1008942-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:13:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F1krGyBv8xk8

On 09/08/20 18:54, Daniel P. Berrangé wrote:
> Some applications want to pass quite large values for the OEM strings
> entries. Rather than having huge strings on the command line, it would
> be better to load them from a file, as supported with -fw_cfg.
> 
> This introduces the "valuefile" parameter allowing for:

s/valuefile/path/

> 
>   $ echo -n "thisthing" > mydata.txt
>   $ qemu-system-x86_64 \
>     -smbios type=11,value=something \
>     -smbios type=11,valuefile=mydata.txt \

s/valuefile/path/


>     -smbios type=11,value=somemore \
>     ...other args...
> 
> Now in the guest
> 
> $ dmidecide -t 11

s/decide/decode/

(sorry for the piecemeal feedback -- I report these as I run into them)

Thanks!
Laszlo

> Getting SMBIOS data from sysfs.
> SMBIOS 2.8 present.
> 
> Handle 0x0E00, DMI type 11, 5 bytes
> OEM Strings
> 	String 1: something
> 	String 2: thisthing
> 	String 3: somemore
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/smbios/smbios.c | 72 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 7cc950b41c..8450fad285 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -110,7 +110,7 @@ static struct {
>  
>  static struct {
>      size_t nvalues;
> -    const char **values;
> +    char **values;
>  } type11;
>  
>  static struct {
> @@ -314,6 +314,11 @@ static const QemuOptDesc qemu_smbios_type11_opts[] = {
>          .type = QEMU_OPT_STRING,
>          .help = "OEM string data",
>      },
> +    {
> +        .name = "path",
> +        .type = QEMU_OPT_STRING,
> +        .help = "OEM string data from file",
> +    },
>  };
>  
>  static const QemuOptDesc qemu_smbios_type17_opts[] = {
> @@ -641,6 +646,8 @@ static void smbios_build_type_11_table(void)
>  
>      for (i = 0; i < type11.nvalues; i++) {
>          SMBIOS_TABLE_SET_STR_LIST(11, type11.values[i]);
> +        g_free(type11.values[i]);
> +        type11.values[i] = NULL;
>      }
>  
>      SMBIOS_BUILD_TABLE_POST;
> @@ -940,9 +947,8 @@ static void save_opt(const char **dest, QemuOpts *opts, const char *name)
>  
>  
>  struct opt_list {
> -    const char *name;
>      size_t *ndest;
> -    const char ***dest;
> +    char ***dest;
>  };
>  
>  static int save_opt_one(void *opaque,
> @@ -951,23 +957,61 @@ static int save_opt_one(void *opaque,
>  {
>      struct opt_list *opt = opaque;
>  
> -    if (!g_str_equal(name, opt->name)) {
> -        return 0;
> +    if (g_str_equal(name, "path")) {
> +        g_autoptr(GByteArray) data = g_byte_array_new();
> +        g_autofree char *buf = g_new(char, 4096);
> +        ssize_t ret;
> +        int fd = qemu_open(value, O_RDONLY);
> +        if (fd < 0) {
> +            error_setg(errp, "Unable to open %s: %s", value, strerror(errno));
> +            return -1;
> +        }
> +
> +        while (1) {
> +            ret = read(fd, buf, 4096);
> +            if (ret == 0) {
> +                break;
> +            }
> +            if (ret < 0) {
> +                error_setg(errp, "Unable to read from %s: %s",
> +                           value, strerror(errno));
> +                return -1;
> +            }
> +            if (memchr(buf, '\0', ret)) {
> +                error_setg(errp, "NUL in OEM strings value in %s", value);
> +                return -1;
> +            }
> +            g_byte_array_append(data, (guint8 *)buf, ret);
> +        }
> +
> +        close(fd);
> +
> +        *opt->dest = g_renew(char *, *opt->dest, (*opt->ndest) + 1);
> +        (*opt->dest)[*opt->ndest] = (char *)g_byte_array_free(data,  FALSE);
> +        (*opt->ndest)++;
> +        data = NULL;
> +   } else if (g_str_equal(name, "value")) {
> +        *opt->dest = g_renew(char *, *opt->dest, (*opt->ndest) + 1);
> +        (*opt->dest)[*opt->ndest] = g_strdup(value);
> +        (*opt->ndest)++;
> +    } else if (!g_str_equal(name, "type")) {
> +        error_setg(errp, "Unexpected option %s", name);
> +        return -1;
>      }
>  
> -    *opt->dest = g_renew(const char *, *opt->dest, (*opt->ndest) + 1);
> -    (*opt->dest)[*opt->ndest] = value;
> -    (*opt->ndest)++;
>      return 0;
>  }
>  
> -static void save_opt_list(size_t *ndest, const char ***dest,
> -                          QemuOpts *opts, const char *name)
> +static bool save_opt_list(size_t *ndest, char ***dest, QemuOpts *opts,
> +                          Error **errp)
>  {
>      struct opt_list opt = {
> -        name, ndest, dest,
> +        ndest, dest,
>      };
> -    qemu_opt_foreach(opts, save_opt_one, &opt, NULL);
> +    if (!qemu_opt_foreach(opts, save_opt_one, &opt, errp)) {
> +        return false;
> +    }
> +    return true;
>  }
>  
>  void smbios_entry_add(QemuOpts *opts, Error **errp)
> @@ -1149,7 +1193,9 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>              if (!qemu_opts_validate(opts, qemu_smbios_type11_opts, errp)) {
>                  return;
>              }
> -            save_opt_list(&type11.nvalues, &type11.values, opts, "value");
> +            if (!save_opt_list(&type11.nvalues, &type11.values, opts, errp)) {
> +                return;
> +            }
>              return;
>          case 17:
>              if (!qemu_opts_validate(opts, qemu_smbios_type17_opts, errp)) {
> 

