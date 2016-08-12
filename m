Received: by 10.25.21.156 with SMTP id 28csp214171lfv;
        Fri, 12 Aug 2016 08:29:30 -0700 (PDT)
X-Received: by 10.55.17.211 with SMTP id 80mr16964313qkr.208.1471015770363;
        Fri, 12 Aug 2016 08:29:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z25si4918355qtz.88.2016.08.12.08.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 08:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYEOn-0006QQ-K6
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 11:29:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bYE2u-0000u5-1O
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 11:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bYE2q-0002jw-O4
	for qemu-arm@nongnu.org; Fri, 12 Aug 2016 11:06:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bYE2q-0002jp-FO; Fri, 12 Aug 2016 11:06:48 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01E382EEF;
	Fri, 12 Aug 2016 15:06:47 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7CEp2kl023233; Fri, 12 Aug 2016 10:51:03 -0400
Date: Fri, 12 Aug 2016 16:51:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Lv Zheng <lv.zheng@intel.com>
Message-ID: <20160812165100.7fc99c64@nial.brq.redhat.com>
In-Reply-To: <596008a543fe75e5c91db0cf7fd0cf4b2a6a2ca1.1470907810.git.lv.zheng@intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470907810.git.lv.zheng@intel.com>
	<596008a543fe75e5c91db0cf7fd0cf4b2a6a2ca1.1470907810.git.lv.zheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 12 Aug 2016 15:06:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 1/2] ACPI: Cleanup -acpitable option code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Lv Zheng <zetalog@gmail.com>, armbru@redhat.com,
	qemu-arm@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, eblake@redhat.com,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lfm8DK8tsXqo

On Thu, 11 Aug 2016 17:36:38 +0800
Lv Zheng <lv.zheng@intel.com> wrote:

> In -acpitable options, at least/most one data/file sub-option is mandatory,
> this patch cleans up the code to reflect this in a managed manner so that
> the follow-up mandatory sub-options can be added to -acpitable.
> 
> Signed-off-by: Lv Zheng <lv.zheng@intel.com>
> ---
>  hw/acpi/core.c   |   32 +++++++++++++++++++++++---------
>  qapi-schema.json |   26 +++++++-------------------
>  qemu-options.hx  |    7 +++++--
>  3 files changed, 35 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index e890a5d..85e0e94 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -89,8 +89,6 @@ static int acpi_checksum(const uint8_t *data, int len)
>   * It is valid to call this function with
>   * (@blob == NULL && bloblen == 0 && !has_header).
>   *
> - * @hdrs->file and @hdrs->data are ignored.
> - *
unrelated change?

>   * SIZE_MAX is considered "infinity" in this function.
>   *
>   * The number of tables that can be installed is not limited, but the 16-bit
> @@ -229,7 +227,8 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
>                                        ACPI_TABLE_PFX_SIZE, acpi_payload_size);
>  }
>  
> -void acpi_table_add(const QemuOpts *opts, Error **errp)
> +static void acpi_table_from_file(bool has_header, const char *file,
> +                                 const QemuOpts *opts, Error **errp)
>  {
>      AcpiTableOptions *hdrs = NULL;
>      Error *err = NULL;
> @@ -249,12 +248,8 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
>      if (err) {
>          goto out;
>      }
> -    if (hdrs->has_file == hdrs->has_data) {
> -        error_setg(&err, "'-acpitable' requires one of 'data' or 'file'");
> -        goto out;
> -    }
>  
> -    pathnames = g_strsplit(hdrs->has_file ? hdrs->file : hdrs->data, ":", 0);
> +    pathnames = g_strsplit(file, ":", 0);
>      if (pathnames == NULL || pathnames[0] == NULL) {
>          error_setg(&err, "'-acpitable' requires at least one pathname");
>          goto out;
> @@ -291,7 +286,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
>          close(fd);
>      }
>  
> -    acpi_table_install(blob, bloblen, hdrs->has_file, hdrs, &err);
> +    acpi_table_install(blob, bloblen, has_header, hdrs, &err);
>  
>  out:
>      g_free(blob);
> @@ -301,6 +296,25 @@ out:
>      error_propagate(errp, err);
>  }
>  
> +void acpi_table_add(const QemuOpts *opts, Error **errp)
> +{
> +    const char *val;
> +
> +    val = qemu_opt_get((QemuOpts *)opts, "file");
> +    if (val) {
> +        acpi_table_from_file(true, val, opts, errp);
> +        return;
> +    }
> +
> +    val = qemu_opt_get((QemuOpts *)opts, "data");
> +    if (val) {
> +        acpi_table_from_file(false, val, opts, errp);
> +        return;
> +    }
> +
> +    error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
> +}
> +
>  static bool acpi_table_builtin = false;
>  
>  void acpi_table_add_builtin(const QemuOpts *opts, Error **errp)
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 5658723..75b8b3b 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -3597,17 +3597,17 @@
>  ##
>  # @AcpiTableOptions
>  #
> -# Specify an ACPI table on the command line to load.
> +# Specify ACPI table options for the table loaded on the command line.
>  #
> -# At most one of @file and @data can be specified. The list of files specified
> -# by any one of them is loaded and concatenated in order.


> -# If both are omitted, @data is implied.
You are removing this bit of documentation, which is still true


> +# ACPI table can be loaded via 'file' and 'data' options. At most one of
> +# 'file' and 'data' can be specified. The list of files specified by any one
> +# of them is loaded and concatenated in order.
>  #
>  # Other fields / optargs can be used to override fields of the generic ACPI
>  # table header; refer to the ACPI specification 5.0, section 5.2.6 System
>  # Description Table Header. If a header field is not overridden, then the
> -# corresponding value from the concatenated blob is used (in case of @file), or
> -# it is filled in with a hard-coded value (in case of @data).
> +# corresponding value from the concatenated blob is used (in case of 'file'),
> +# or it is filled in with a hard-coded value (in case of 'data').
>  #
>  # String fields are copied into the matching ACPI member from lowest address
>  # upwards, and silently truncated / NUL-padded to length.
> @@ -3628,16 +3628,6 @@
>  # @asl_compiler_rev: #optional revision number of the utility that created the
>  #                    table (4 bytes)
>  #
> -# @file: #optional colon (:) separated list of pathnames to load and
> -#        concatenate as table data. The resultant binary blob is expected to
> -#        have an ACPI table header. At least one file is required. This field
> -#        excludes @data.
> -#
> -# @data: #optional colon (:) separated list of pathnames to load and
> -#        concatenate as table data. The resultant binary blob must not have an
> -#        ACPI table header. At least one file is required. This field excludes
> -#        @file.
> -#
>  # Since 1.5
>  ##
>  { 'struct': 'AcpiTableOptions',
> @@ -3648,9 +3638,7 @@
>      '*oem_table_id':      'str',
>      '*oem_rev':           'uint32',
>      '*asl_compiler_id':   'str',
> -    '*asl_compiler_rev':  'uint32',
> -    '*file':              'str',
> -    '*data':              'str' }}
> +    '*asl_compiler_rev':  'uint32' }}
it's probably is not ok to remove fields here
as it might break existing users that expect them

>  
>  ##
>  # @CommandLineParameterType:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index a71aaf8..5fe7f87 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1493,10 +1493,13 @@ Disable HPET support.
>  ETEXI
>  
>  DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
> -    "-acpitable [sig=str][,rev=n][,oem_id=str][,oem_table_id=str][,oem_rev=n][,asl_compiler_id=str][,asl_compiler_rev=n][,{data|file}=file1[:file2]...]\n"
> +    "-acpitable {data|file}=file1[:file2]...\n"
> +    "             [,sig=str][,rev=n]\n"
> +    "             [,oem_id=str][,oem_table_id=str][,oem_rev=n]\n"
> +    "             [,asl_compiler_id=str][,asl_compiler_rev=n]\n"
>      "                ACPI table description\n", QEMU_ARCH_I386)
>  STEXI
> -@item -acpitable [sig=@var{str}][,rev=@var{n}][,oem_id=@var{str}][,oem_table_id=@var{str}][,oem_rev=@var{n}] [,asl_compiler_id=@var{str}][,asl_compiler_rev=@var{n}][,data=@var{file1}[:@var{file2}]...]
> +@item -acpitable data=@var{file1}[:@var{file2}]...[,sig=@var{str}][,rev=@var{n}][,oem_id=@var{str}][,oem_table_id=@var{str}][,oem_rev=@var{n}] [,asl_compiler_id=@var{str}][,asl_compiler_rev=@var{n}]
>  @findex -acpitable
>  Add ACPI table with specified header fields and context from specified files.
>  For file=, take whole ACPI table from the specified files, including all

